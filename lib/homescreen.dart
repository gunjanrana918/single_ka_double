import 'dart:async';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:single_ka_double/loginscreen.dart';
import 'package:single_ka_double/managewallet.dart';
import 'package:single_ka_double/paynowscreen.dart';
import 'package:single_ka_double/recahrgescreen.dart';
import 'package:single_ka_double/redeemcoins.dart';
import 'package:single_ka_double/resetpassword.dart';
import 'package:single_ka_double/shareandearn.dart';
import 'package:single_ka_double/show_game.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:single_ka_double/updateprofile.dart';
import 'package:single_ka_double/wallethistory.dart';
import 'package:single_ka_double/winninghistory.dart';
import 'package:single_ka_double/winningnumber.dart';

import 'change_password.dart';
import 'myprofile.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescreen(),
    ));

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
    getdata();
    getdata();
  }

  //****wallet balance*****//
  Future<void> getdata() async {
    var req = await http.get(Uri.parse('http://singlekadouble.iotans'
        '.in/api/wbalance?cid=' +
        universaldata.cid));
    setState(() {
      universaldata.walletbalance = req.body;
    });

  }
  //exit code from app//
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Single ka Double',
            style: TextStyle(fontSize: 16.0,color: Colors.white),
          ),
          actions: <Widget>[
        Padding(padding: EdgeInsets.only(left: 30.0),),
     Container(
       child: Image.asset('custom/money.png',width: 20.0,),
     ),
      // const Icon(Icons.currency_rupee_sharp,color: Colors.yellow,),
            Padding(padding: EdgeInsets.only(left: 0.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) {
                        return recharge();
                      }));
                },
                child: Text(
                  universaldata.walletbalance,
                  style: TextStyle(color: Colors.white),
                )),
            ),

          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('custom/backgroundimage.jpeg'),
                      fit: BoxFit.cover),
                ),
                child: Image.asset('custom/logo.png'),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Image.asset('custom/profile.png'),
                  title: Text(
                    'My Profile',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => profie()));
                  },
                ),
              ),
              ListTile(
                  leading: Image.asset('custom/updateprofile.png'),
                  title: Text(
                    'Profile update',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => updateprofile()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.lock_outline,
                    size: 30.0,
                    color: Colors.brown,
                  ),
                  title: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resetpassword()));
                  }),
              ListTile(
                  leading: Image.asset('custom/managewallet.png'),
                  title: Text(
                    'Manage Wallet',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => managewallet()));
                  }),
              ListTile(
                  leading: Image.asset('custom/walletmoney.png'),
                  title: Text(
                    'Wallet history',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => wallethistory()));
                  }),
              ListTile(
                  leading: Image.asset('custom/winningicon.png'),
                  title: Text(
                    'Winning history',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => winhistory()));
                  }),
              ListTile(
                  leading: Image.asset('custom/winningnumber.png'),
                  title: Text(
                    'Winning number',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => winnumber()));
                  }),
              ListTile(
                leading: Image.asset('custom/aboutus.png'),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              ListTile(
                  leading: Image.asset('custom/redeemcoin.png'),
                  title: Text(
                    'Redeem cash',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => redeemcoins()));
                  }),
              ListTile(
                leading: Image.asset('custom/shareapp.png'),
                title: Text(
                  'Share app',
                  style: TextStyle(fontSize: 15.0),
                ),
                onTap: (){

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => share$earn()));
                },
              ),
              ListTile(
                  leading: Image.asset('custom/logout.png'),
                  title: Text(
                    'Signout',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('custom/backgroundimage.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Column(
                children: [
                  Image.asset(
                    'custom/logo.png',
                    height: 180,
                    width: 200,
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        universaldata.name,
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: false,
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Predict & Win',
                        textStyle: const TextStyle(
                          fontSize: 28.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    repeatForever: true,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: false,
                  ),
                  //start button
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.teal, width: 2.0)))),
                        child: Text(
                          'Start',
                          style: TextStyle(
                              fontSize: 30.0, fontStyle: FontStyle.italic),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => showgameimage()));
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
