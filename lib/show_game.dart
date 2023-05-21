import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:single_ka_double/runnung_gamescreen.dart';
import 'package:single_ka_double/universaldata.dart';

import 'homescreen.dart';
import 'recahrgescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showgameimage(),
    ));

class showgameimage extends StatefulWidget {
  const showgameimage({Key? key}) : super(key: key);

  @override
  _showgameimageState createState() => _showgameimageState();
}

class _showgameimageState extends State<showgameimage> {
  @override
  void initState() {
    // TODO: implement initState

    Future<void> getdata() async {
      var req = await http.get(Uri.parse('http://singlekadouble.iotans'
          '.in/apigame/grunninggame'));
      if (req.body.contains('SERVER')) {
        Fluttertoast.showToast(
            msg: "No Game Available. Please Try Again Later!",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return homescreen();
        }));
        // Navigator.of(context).pop(true);
        return;
      }
      else {
        var logindatastr = req.body.split(",");
        var gameid = logindatastr[0];
        universaldata.gid = gameid;
        var gamename = logindatastr[1];
        universaldata.gname = gamename;
        var gameimage = logindatastr[2];
        universaldata.gimage = gameimage;
        var gamedate = logindatastr[3];
        universaldata.gdate = gamedate;
        var gametime = logindatastr[4];
        universaldata.gstime = gametime;
        var gameendtime = logindatastr[5];
        universaldata.getime = gameendtime;
        var gcountime = logindatastr[6];
        universaldata.gcount = gcountime;

      }
    }

    getdata();
    getdata();
    getdata();

    super.initState();
    getdata();
    getdata();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single ka Double'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            child: Image.asset(
              'custom/money.png',
              width: 25.0,
            ),
          ),
          // const Icon(Icons.currency_rupee_sharp,color: Colors.yellow,),
          Padding(
              padding: EdgeInsets.only(left: 0.0),
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
                  )))
        ],
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
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  universaldata.gid,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(
                  universaldata.gname,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Image.network(
                  'http://singlekadouble'
                          '.iotans.in/uploaddocs/gameimage/' +
                      universaldata.gimage,
                  height: 150,
                  width: 200,
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                  universaldata.gdate,
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(
                  universaldata.gstime +
                      "       -       " +
                      universaldata.getime,
                  style: TextStyle(fontSize: 20.0),
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
                    'Play now',
                    style:
                        TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => runninggame()));
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
