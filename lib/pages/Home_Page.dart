import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';
import 'package:weather_app/Providers/weather_Providers.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {



  void UpdateUi(){
    setState((){});
  }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData =Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    updateUi: UpdateUi,
                  );
                }));
              },
              icon: Icon(Icons.search)),
        ],
        title: Text('Weather App'),
      ),
      body:weatherData==null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),

      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[300]!,
              weatherData!.getThemeColor()[100]!,

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),

            Text(Provider.of<WeatherProvider>(context).cityName!,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black
            ),),
            Text('Updated : ${weatherData!.date}',style: TextStyle(
                fontSize: 20,

            ),),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                Text('${weatherData!.temp.toInt().toString()}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black
                ),),
                Column(
                  children: [

                    Text('maxtemp : ${weatherData!.maxTemp.toInt()} ',style: TextStyle(
                      fontSize: 20,

                    ),),
                    Text('mintemp : ${weatherData!.minTemp.toInt()}',style: TextStyle(
                      fontSize: 20,

                    ),),
                  ],
                ),
              ],
            ),
            Spacer(),

            Text(weatherData!.weatherStateName,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black
            ),),

          Spacer(flex: 5,),

          ],
        ),
      ),
    );
  }
}
