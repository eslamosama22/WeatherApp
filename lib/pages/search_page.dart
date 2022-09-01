import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';
import 'package:weather_app/Providers/weather_Providers.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? CityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: TextField(
            onChanged: (data){
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;
              WeatherServices services = WeatherServices();
              WeatherModel weather =
                  await services.getWeather(CityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  CityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Search City Name',
              label: Text(
                'Search',
              ),
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                child: Icon(Icons.search),
                onTap: ()async {
                  WeatherServices services = WeatherServices();
                  WeatherModel weather =
                      await services.getWeather(CityName: CityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData =
                      weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName =
                      CityName;

                  Navigator.pop(context);
                },
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
