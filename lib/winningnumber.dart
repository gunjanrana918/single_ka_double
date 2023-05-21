import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: winnumber(),
    ));

class winnumber extends StatefulWidget {
  const winnumber({Key? key}) : super(key: key);

  @override
  _winnumberState createState() => _winnumberState();
}

class _winnumberState extends State<winnumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Winning Number'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('custom/backgroundimage.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
