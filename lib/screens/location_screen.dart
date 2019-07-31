import 'package:flutter/material.dart';
import '../utils/conistants.dart';
import '../services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String conditionIcon;
  String cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }
  void updateUI(dynamic wD){
    setState(() {
      if(wD == null){
        temperature =0;
        conditionIcon = 'error';
        cityName = '';
        return;
      }else {
        num temp = wD['main']['temp'];
        temperature = temp.toInt();
        int condition = wD['weather'][0]['id'];
        conditionIcon = weather.getWeatherIcon(condition);
        cityName = "${weather.getMessage(temperature)} in ${wD['name']}";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            //what is this???
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async{
                        updateUI(await weather.getLocationWeather());
                      },
                      child: Icon(Icons.near_me,size: 50.0,),
                    ),
                    FlatButton(
                      onPressed: () async{
                        var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context)=> CityScreen()));

                        if(cityName != null){
                         var weatherData = await weather.getLocationWeatherByCity(cityName);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(Icons.location_city,size: 50.0,),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text('$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        conditionIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                      cityName,
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
