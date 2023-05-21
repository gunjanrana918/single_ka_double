import 'package:flutter/material.dart';
import 'package:single_ka_double/resetpassword.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.deepOrange,
    ),
    home: ForgotPassword(),
  ));
}

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final mobilecontroller = TextEditingController();
    final otpcontroller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Forgot Password',
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('custom/backgroundimage.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child:
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: mobilecontroller,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Mobile No."),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  // ignore: deprecated_member_use
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.teal, width: 2)),
                      )),
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () async {
                        var req =
                            await http.get(Uri.parse('http://singlekadouble.iotans'
                            '.in/api/otpfor_resetpassword?dmobile=' +
                            mobilecontroller.text.replaceAll(" ", "")));
                      }),
                  Divider(
                    thickness: 2.0,
                    color: Colors.grey,),

                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  TextFormField(
                    controller: otpcontroller,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Enter OTP"),
                  ),
                  // ignore: deprecated_member_use
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.teal, width: 2)),
                    )),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    resetpassword()));

                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
