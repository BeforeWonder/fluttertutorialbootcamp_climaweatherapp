import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import '../services/networking.dart';
const kApiKey ="6ec9d8fd5245789a3efd2c5c58cfbe00";
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
   double latitude;
   double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

    void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String url ="https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    print(weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            onPressed: (){
             print('pressed');
            },
            child: Text('Get Location'),
        ),
      ),
    );
  }
}
