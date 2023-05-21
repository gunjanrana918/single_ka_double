import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:single_ka_double/homescreen.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:single_ka_double/welcomescreen.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    ));

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  //*****shared preference****/

  void check_if_already_login() async {
    var logindata = await SharedPreferences.getInstance();
    var newuser = (logindata.getBool('login') ?? true);

    if (newuser == false) {
      universaldata.cid = logindata.getString('cid')!;
      universaldata.name = logindata.getString('name')!;
      universaldata.loginid = logindata.getString('mobile')!;
      universaldata.password = logindata.getString('password')!;
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => homescreen()));
    }
  }

  @override
  void initState() {
    check_if_already_login();
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => welcomescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('custom/splashscreen.jpeg'),
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
