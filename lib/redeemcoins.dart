import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:http/http.dart' as http;

import 'homescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: redeemcoins(),
    ));

class redeemcoins extends StatefulWidget {
  const redeemcoins({Key? key}) : super(key: key);

  @override
  _redeemcoinsState createState() => _redeemcoinsState();
}

class _redeemcoinsState extends State<redeemcoins> {


  Future<void> getdata() async {
    var req = await http.get(Uri.parse('http://singlekadouble.iotans'
        '.in/api/rewardbalance?cid=' +
        universaldata.cid));
     universaldata.coins = req.body;
     print(universaldata.cid);
    print(req.body);
     print('VALUE' + universaldata.coins);
  }

  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
    getdata();
  }
  var response ;
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Redeem Coins'),
        centerTitle: true,
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
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  'Single ka Double',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  '1 INR = 1 Coin',
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Image.asset(
                  'custom/redeemcoin1.png',
                ),
                Text(
                  'Current Coin Balance',
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  universaldata.coins,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                              BorderSide(color: Colors.teal, width: 2.0)))),
                  child: Text(
                    'Redeem coins',
                    style:
                    TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
                  ),
                  onPressed: () async {

                      var req = await http.get(
                          Uri.parse('http://singlekadouble.iotans'
                              '.in/api/redeemcash?cid=' +
                              universaldata.cid));
                      // response= req.body;
                      //  result= jsonDecode(response).toString();
                      if(req.body.contains('Added')){
                        Fluttertoast.showToast(
                          msg: "Reward Added into Wallet.",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 15.0);
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return homescreen();
                            }));
                      });
                      return;
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Try after sometime",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return homescreen();
                              }));
                        });
                        return;
                      }
                  },
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}


