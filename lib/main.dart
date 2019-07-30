import 'package:flutter/material.dart';
import './screens/loading_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//
//double temp = decodedData['main']['temp'];
//int id = decodedData['weather'][0]['id'];
//String name = decodedData['name'];