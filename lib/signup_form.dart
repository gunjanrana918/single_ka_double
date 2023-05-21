import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:single_ka_double/loginscreen.dart';
import 'package:single_ka_double/universaldata.dart';

import 'mobileverify.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: registrationform(),
    ));

class registrationform extends StatefulWidget {
  const registrationform({Key? key}) : super(key: key);

  @override
  _registrationformState createState() => _registrationformState();
}

class _registrationformState extends State<registrationform> {
  bool ishiddenpassword = true;

  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  final accountnocontroller = TextEditingController();
  final ifsccontroller = TextEditingController();
  final banknamecontroller = TextEditingController();
  final branchnamecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool agree = false;
  void _doSomething() {
    // Do something
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single ka Double'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormField(
                controller: namecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Name should be same as bank account',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormField(
                controller: mobilecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(Icons.phone_android_sharp),
                  hintText: 'Enter your mobile',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormField(
                controller: citycontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: const Icon(Icons.location_city_sharp),
                  hintText: 'Enter City',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormField(
                controller: passcontroller,
                obscureText: ishiddenpassword,
                decoration: InputDecoration(
                    icon: const Icon(Icons.lock_outline),
                    hintText: 'Enter password',
                    errorText: 'password must be atleast 6 character',
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        Icons.visibility,
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormField(
                controller: confirmpasscontroller,
                obscureText: ishiddenpassword,
                decoration: InputDecoration(
                    icon: const Icon(Icons.lock_outline_sharp),
                    hintText: 'Confirm password',
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        Icons.visibility,
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              //terms and condition checkbox
              Row(
                children: [
                  Material(
                    child: Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    'I have read and accept terms and conditions.',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.purpleAccent),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      if (namecontroller.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Enter Name.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      } else if (mobilecontroller.text.length != 10) {
                        Fluttertoast.showToast(
                            msg: "Enter 10 digit.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      } else if (passcontroller.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Enter Password.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      } else if (passcontroller.text !=
                          confirmpasscontroller.text) {
                        Fluttertoast.showToast(
                            msg: "Confirm password not same as password.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      }
                      //*****SAVE THE USER DETAILS ON SUBMIT*****
                      else if (passcontroller.text == confirmpasscontroller.text)
                        {
    universaldata.name = namecontroller.text;
    universaldata.loginid = mobilecontroller.text;
    universaldata.city = citycontroller.text;
    universaldata.password = passcontroller.text;
    universaldata.confirmpassword = confirmpasscontroller.text;
    universaldata.accountno = accountnocontroller.text;
    universaldata.bankname = banknamecontroller.text;
    universaldata.confirmpassword = confirmpasscontroller.text;


    var req = await http.get(Uri.parse(
    'http://singlekadouble.iotans.in/api/otpfor_checkphone?dmobile=' +
    mobilecontroller.text.replaceAll(" ", "")));
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (BuildContext context) => mobileotp()));


                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amberAccent),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        fontSize: 18.0,
                      ),
                    ),
                  ), //**********************
                  Padding(padding: EdgeInsets.only(left: 30.0, right: 20.0)),
                  //**********signin button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amberAccent),
                    ),
                    child: Text(
                      'Signin',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ishiddenpassword = !ishiddenpassword;
    });
  }
}

String? validateUserName(String value) {
  if (value.isEmpty) {
    return "Username is required";
  }
  return null;
}

String? validatePassword(String value) {
  print(value);
  universaldata.password = value;
  if (value.isEmpty) {
    return "Password must be enter";
  }
  return null;
}

String? validatePassword1(String value) {
  print(value);
  universaldata.confirmpassword = value;

  if (value.isEmpty) {
    return "Password must be enter";
  }
  return null;
}

String? validateMobile(String value) {
  if (value.length == 10) {
    return "Mobile no. required 10 digit";
  } else if (value.isEmpty) {
    return "Mobile no. is required";
  }
  return null;
}
