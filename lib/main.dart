// @dart=2.9
import 'package:flutter/material.dart';
import 'package:single_ka_double/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
    ),
    home: splashscreen(),
  ));
}
