import 'package:flutter/material.dart';
import '../utils/conistants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  int condition;
  String cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }
  void updateUI(dynamic wD){
    double temp = wD['main']['temp'];
    temperature = temp.toInt();
    condition = wD['weather'][0]['id'];
    cityName = wD['name'];
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
                      onPressed: (){},
                      child: Icon(Icons.near_me,size: 50.0,),
                    ),
                    FlatButton(
                      onPressed: (){},
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
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                      "It's 🍦 time in San Francisco!",
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
