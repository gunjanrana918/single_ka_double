import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/binding.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:single_ka_double/forgotpassword.dart';
import 'package:single_ka_double/homescreen.dart';
import 'package:single_ka_double/signup_form.dart';
import 'package:single_ka_double/universaldata.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      // ignore: deprecated_member_use
      accentColor: Colors.deepOrange,
    ),
    home: LoginScreen(),
  ));
}

late SharedPreferences localstorage;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  static init() async {
    localstorage = await SharedPreferences.getInstance();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool ishiddenpassword = true;
  final mobilecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    if (newuser == false) {
      universaldata.name = logindata.getString('name')!;
      universaldata.loginid = logindata.getString('loginid')!;
      universaldata.password = logindata.getString('password')!;
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) {
        return homescreen();
      }));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mobilecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

// ignore: non_constant_identifier_names

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Container(
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('custom/logo.png'),
                        fit: BoxFit.scaleDown)),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4, right: 20.0),
                      child: TextFormField(
                          controller: mobilecontroller,
                          decoration: InputDecoration(
                              hintText: 'Mobile',
                              prefixIcon: Icon(Icons.phone_android)),
                          validator: MultiValidator([
                            RequiredValidator(errorText: '* Required'),
                            MinLengthValidator(10,
                                errorText: 'Mobile number should be 10 digit'),
                          ])),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 4, right: 20.0),
                  child: TextFormField(
                    controller: passwordcontroller,
                    obscureText: ishiddenpassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            Icons.visibility,
                          ),
                        )),
                    validator: MultiValidator([
                      RequiredValidator(errorText: '* Required'),
                      MinLengthValidator(6,
                          errorText: 'Password should be atleast 6 character')
                    ]),
                  ),
                )),
              ]),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                // ignore: deprecated_member_use
                child: RaisedButton(
                    color: Colors.amberAccent,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      if (mobilecontroller.text.length == 0) {
                        Fluttertoast.showToast(
                            msg: "Enter mobile no.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      }
                      if (passwordcontroller.text.length == 0) {
                        Fluttertoast.showToast(
                            msg: "Enter Password.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        Future<void> getdata() async {
                          var req = await http.get(Uri.parse('http://singlekadouble.iotans'
                                      '.in/api/clogin?cloginid=' +
                                  mobilecontroller.text.replaceAll(" ", "") +
                                  '&cpassword=' +
                                  passwordcontroller.text.replaceAll(" ", "") +
                                  ''));

                          if (req.body.contains(mobilecontroller.text)) {
                            print('hello' + req.body);
                            //For Sharedpreferance
                            String loginid = mobilecontroller.text;
                            String password = passwordcontroller.text;
                            print('MOBILE' + universaldata.loginid);
                            if (loginid != '' && password != '') {
                              logindata.setBool('login', false);
                              logindata.setString(
                                  'loginid', mobilecontroller.text.toString());
                              logindata.setString('password',
                                  passwordcontroller.text.toString());
                            }

                            //***********************

                            universaldata.password = passwordcontroller.text;
                            var logindatastr = req.body.split(",");
                            var id = logindatastr[0]
                                .replaceAll("cid", "")
                                .replaceAll("\"", "");
                            var name = logindatastr[1]
                                .replaceAll("name", "")
                                .replaceAll("\"", "");
                            var cloginid = logindatastr[2]
                                .replaceAll("mobile", "")
                                .replaceAll("\"", "");
                            var cpassword = logindatastr[3]
                                .replaceAll("password", "")
                                .replaceAll("\"", "");
                            var ccity = logindatastr[4]
                                .replaceAll("city", "")
                                .replaceAll("\"", "");
                            var caccountno = logindatastr[5]
                                .replaceAll("accountno", "")
                                .replaceAll("\"", "");
                            var cifsccode = logindatastr[6]
                                .replaceAll("accountno", "")
                                .replaceAll("\"", "");
                            var cbankname = logindatastr[7]
                                .replaceAll("bankname", "")
                                .replaceAll("\"", "");
                            var cbranchname = logindatastr[8]
                                .replaceAll("branchname", "")
                                .replaceAll("\"", "");

                            universaldata.cid = id;
                            var reqq = await http.get(Uri.parse('http://singlekadouble.iotans'
                                '.in/api/wbalance?cid=' +
                                universaldata.cid));
                            universaldata.walletbalance = reqq.body;
                            logindata.setString('cid', id);
                            universaldata.name = name.replaceAll(":", "");
                            logindata.setString('name', universaldata.name);
                            universaldata.loginid =
                                cloginid.replaceAll(":", "");
                            logindata.setString(
                                'mobile', universaldata.loginid);
                            universaldata.password =
                                cpassword.replaceAll(":", "");
                            logindata.setString(
                                'password', universaldata.password);
                            universaldata.city = ccity.replaceAll(":", "");
                            logindata.setString('city', universaldata.city);
                            universaldata.accountno =
                                caccountno.replaceAll(":", "");
                            logindata.setString(
                                'accountno', universaldata.accountno);
                            universaldata.bankifsccode =
                                cifsccode.replaceAll(":", "");
                            logindata.setString(
                                'ifsccode', universaldata.bankifsccode);
                            universaldata.bankname =
                                cbankname.replaceAll(":", "");
                            logindata.setString(
                                'bankname', universaldata.bankname);
                            universaldata.branchname =
                                cbranchname.replaceAll(":", "");
                            logindata.setString(
                                'branchname', universaldata.branchname);
                            Navigator.of(context).pop(true);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homescreen()));
                          } else
                          {
                            Fluttertoast.showToast(
                                msg: "Please enter valid Credentials.",
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 13.0);
                            return;
                          }
                        }

                        getdata();
                      }

                      //***********************
                    }),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      'forgot password',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      registrationform()));
                        },
                        child: RichText(
                            text: TextSpan(
                                text: 'Signup',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline))))
                  ]),
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
