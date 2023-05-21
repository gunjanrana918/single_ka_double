import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/binding.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:single_ka_double/loginscreen.dart';
import 'package:single_ka_double/universaldata.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: resetpassword(),
  ));
}

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  _resetpasswordState createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  bool ishiddenpassword = false;
  @override
  Widget build(BuildContext context) {
     final oldpasswordcontroller = TextEditingController();
    final newpasswordcontroller = TextEditingController();
    final confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New password',
        ),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('custom/backgroundimage.jpeg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: oldpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'Enter old password',
                        // suffixIcon: InkWell(
                        //   onTap: _togglePasswordView,
                        //   child: Icon(
                        //     Icons.visibility,
                        //   ),
                        // )
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: newpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'Enter new password',
                        // suffixIcon: InkWell(
                        //   onTap: _togglePasswordView,
                        //   child: Icon(
                        //     Icons.visibility,
                        //   ),
                        // )
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: '* Required'),
                        MinLengthValidator(6,
                            errorText: 'Password should be atleast 6 character')
                      ]),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: confirmpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'Confirm new password',
                        // suffixIcon: InkWell(
                        //   onTap: _togglePasswordView,
                        //   child: Icon(
                        //     Icons.visibility,
                        //   ),
                        // )
                      ),
                    ),
                  ),
                ]),
                Padding(padding: EdgeInsets.only(top: 30.0)),
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
                      'Submit',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                   if  (oldpasswordcontroller.text.length == 0){
                Fluttertoast.showToast(
                msg: "Enter old password",
                gravity: ToastGravity.BOTTOM,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize:13.0);
                     return;

                }
                   else if
                     (newpasswordcontroller.text.length == 0) {
                        Fluttertoast.showToast(
                            msg: "Enter new password",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      } else if (confirmpasswordcontroller.text.length == 0) {
                        Fluttertoast.showToast(
                            msg: "Enter confirm password",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);

                        return;
                      } else if (newpasswordcontroller.text !=
                          confirmpasswordcontroller.text) {
                        // ignore: deprecated_member_use
                        Widget gotIt1 = FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.white,
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        resetpassword()));
                          },
                        );
                        AlertDialog alert = AlertDialog(
                          title: Text("Error"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          backgroundColor: Colors.brown[300],
                          content: Text("Confirm password does not match"),
                          actions: [
                            gotIt1,
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );

                        return;
                      } else {
                        Future<void> getdata() async {
                          var req = await http.get(Uri.parse(
                              'http://singlekadouble.iotans.in/api/cresetpassword?&cid=' +
                                  universaldata.cid
                                      .replaceAll(" ", "") +
                                  '&cpassword=' +
                                  oldpasswordcontroller.text
                                      .replaceAll(" ", "") +
                                  '&cnewpassword=' +
                                  newpasswordcontroller.text
                                      .replaceAll(" ", "") +
                                  ''));
                          if (req.body
                              .contains("NEW Password save Successfully")) {
                            // ignore: deprecated_member_use
                            Widget gotIt = FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.white,
                              child: Text("Ok"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen()));
                              },
                            );
                            AlertDialog alert = AlertDialog(
                              title: Text("SUCCESS"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              backgroundColor: Colors.brown[300],
                              content: Text("Your password has been changed"),
                              actions: [
                                gotIt,
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        }

                        getdata();
                      }
                    })
              ],
            ),
          )),
    );
  }
}
