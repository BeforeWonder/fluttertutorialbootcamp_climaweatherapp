import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(fontSize: 100.0, fontFamily: 'Spartan MB');

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB');

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  ),
  filled: true,
  fillColor: Colors.white,
  helperText: "Enter City Name",
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
