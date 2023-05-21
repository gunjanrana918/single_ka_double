import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:single_ka_double/recahrgescreen.dart';
import 'package:single_ka_double/universaldata.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: managewallet(),
    ));

class managewallet extends StatefulWidget {
  const managewallet({Key? key}) : super(key: key);

  @override
  _managewalletState createState() => _managewalletState();
}

class _managewalletState extends State<managewallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Wallet'),
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
                  'custom/addmoneywallet.png',
                ),
                Text(
                  'Current wallet balance',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  universaldata.walletbalance,
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  '1. Recharge Amount can not be redeemed.',
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  '2. Payment Gateway charges & GST Extra.',
                  style: TextStyle(fontSize: 15.0),
                ),
                Padding(padding: EdgeInsets.only(top: 25.0)),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                                  BorderSide(color: Colors.teal, width: 2.0)))),
                  child: Text(
                    'Recharge',
                    style:
                        TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => recharge()));
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
