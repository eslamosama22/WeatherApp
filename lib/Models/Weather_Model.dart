import 'package:flutter/material.dart';

class WeatherModel {
   String date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
 factory WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];
   return WeatherModel(date: data['location']['localtime'], temp: jsonData['avgtemp_c'], maxTemp: jsonData['maxtemp_c'], minTemp: jsonData['mintemp_c'], weatherStateName: jsonData['condition']['text']);

  }
   @override
String toString(){
       return 'temp=$temp mintemp=$minTemp  date=$date';
   }
   String getImage(){
   if(weatherStateName=='Clear'||weatherStateName=='LightCloud'){
     return 'assets/images/clear.png';
   }else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
     return 'assets/images/snow.png';
   }else if(weatherStateName=='Heavy Cloud'){
     return 'assets/images/cloudy.png';
   }else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||weatherStateName=='Partly cloudy'){
     return 'assets/images/rainy.png';
   }else if(weatherStateName=='ThunderStrom'||weatherStateName=='Thunder'){
     return 'assets/images/thunderstorm.png';
   }else{
     return 'assets/images/clear.png';
   }
   }
   MaterialColor getThemeColor(){
     if(weatherStateName=='Clear'||weatherStateName=='LightCloud'){
       return Colors.orange;
     }else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
       return Colors.blue;
     }else if(weatherStateName=='Heavy Cloud'){
       return Colors.blueGrey;
     }else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||weatherStateName=='Partly cloudy'){
       return Colors.blueGrey;
     }else if(weatherStateName=='ThunderStrom'||weatherStateName=='Thunder'){
       return Colors.cyan;
     }else{
       return Colors.orange;
     }
   }

}

