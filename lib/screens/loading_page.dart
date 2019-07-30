import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import '../services/networking.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    String url ="https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: weatherData);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: SpinKitRipple(
         size: 100.0,
         color: Colors.white,
       ),
      ),
    );
  }
}
