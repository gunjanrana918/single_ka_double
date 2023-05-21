import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: winhistory(),
    ));

class winhistory extends StatefulWidget {
  const winhistory({Key? key}) : super(key: key);

  @override
  _winhistoryState createState() => _winhistoryState();
}

class _winhistoryState extends State<winhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Winning History'),
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
