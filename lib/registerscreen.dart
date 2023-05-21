import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:single_ka_double/loginscreen.dart';
import 'package:single_ka_double/signup_form.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Gallary',
      home: registerscreen(),
    ));

class registerscreen extends StatefulWidget {
  @override
  _registerscreenState createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Single ka Double'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('custom/backgroundimage.jpeg'),
                fit: BoxFit.fill),
          ),
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 60)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'custom/logo.png',
                    height: 180,
                    width: 200,
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => registrationform()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ), //**********************
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 20.0)),
                      //**********signin button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent),
                        ),
                        child: Text(
                          'Signin',
                          style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  //********************* Registration button

                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  //*********help button
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amberAccent),
                    ),
                    child: Text(
                      'Help',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
