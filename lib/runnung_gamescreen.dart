import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:single_ka_double/onsubmit_screen.dart';
import 'package:single_ka_double/recahrgescreen.dart';
import 'package:single_ka_double/universaldata.dart';

import 'universaldata.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: runninggame(),
    ));

class runninggame extends StatefulWidget {
  const runninggame({Key? key}) : super(key: key);

  @override
  _runninggameState createState() => _runninggameState();
}

class _runninggameState extends State<runninggame>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  String? get duration => null;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 10));
    _controller.forward();
  }
  late String firstnovalue = "_";
  late String secondnovalue = "_";
  late String thirdnovalue = "_";
  late String fournovalue = "_";
  late String fivenovalue = "_";
  late String sixnovalue = "_";
  late String sevennovalue = "_";
  late String eightnovalue = "_";
  late String ninenovalue = "_";
  @override
  void dispose() {
    _controller.dispose();
    // super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var one = DateFormat.Hm().format(DateTime.now());
    //print('START1' + one.toString());
    var format = DateFormat.Hm();
    var two = format.parse(universaldata.getime);
    var two1 = DateFormat.Hm().format(two);
    //print('START2' + two1.toString());
    //var duration = two1.difference(one);
   //print('DURATION' +duration);
    return Scaffold(
      appBar: AppBar(
        title: Text(universaldata.gname),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) {
                  return recharge();
                }));
              },
              child: Text(
                universaldata.walletbalance,
                style: TextStyle(color: Colors.white),
              ))
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
                Padding(
                    padding: EdgeInsets.only(
                  top: 3.0,
                )),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 5.0)),
                    Text(
                      'Open',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(right: 90.0)),
                    Text(
                      'Running',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Text(
                      'Close',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  children: [
                    Text(
                      universaldata.gstime,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 100.0)),
                    Countdown(
                      animation: StepTween(begin: 10*60 , end: 0)
                          .animate(_controller),
                      key: Key(''),
                    ),
                    Padding(padding: EdgeInsets.only(right: 95.0)),
                    Text(
                      universaldata.getime,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 3.0)),
                Divider(
                  thickness: 3,
                  height: 4,
                  color: Colors.brown,
                ),
                Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 30,
                      width: 50,
                      child: Text(
                        firstnovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          firstnovalue = text.toString();
                          setState(() {
                           text;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        secondnovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          secondnovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        thirdnovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          thirdnovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '4',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        fournovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          fournovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '5',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        fivenovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          fivenovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        sixnovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          sixnovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '7',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        sevennovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          sevennovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '8',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 110.0)),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        eightnovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          eightnovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 7.0)),
                    Text(
                      '9',
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      right: 110.0,
                    )),
                    Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        ninenovalue,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 80.0)),
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        onChanged: (text) {
                          ninenovalue = text.toString();
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.brown),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.teal, width: 2.0)))),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 25.0, fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        if (int.parse(universaldata.walletbalance) < 0 ||
                            universaldata.walletbalance == "") {
                          Fluttertoast.showToast(
                              msg: " Please recharge your wallet!",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.limeAccent,
                              textColor: Colors.black,
                              fontSize: 16.0);
                          return;
                        }
                        Future<void> getdata() async {
                          var bettingnumber = "";
                          var bettingamount = "";
                          if (firstnovalue != "-") {
                            bettingnumber += "1,";
                            bettingamount += firstnovalue + ",";
                          }
                          if (secondnovalue != "-") {
                            bettingnumber += "2,";
                            bettingamount += secondnovalue + ",";
                          }
                          if (thirdnovalue != "-") {
                            bettingnumber += "3,";
                            bettingamount += thirdnovalue + ",";
                          }
                          if (fournovalue != "-") {
                            bettingnumber += "4,";
                            bettingamount += fournovalue + ",";
                          }
                          if (fivenovalue != "-") {
                            bettingnumber += "5,";
                            bettingamount += fivenovalue + ",";
                          }
                          if (sixnovalue != "-") {
                            bettingnumber += "6,";
                            bettingamount += sixnovalue + ",";
                          }
                          if (sevennovalue != "-") {
                            bettingnumber += "7,";
                            bettingamount += sevennovalue + ",";
                          }
                          if (eightnovalue != "-") {
                            bettingnumber += "8,";
                            bettingamount += eightnovalue + ",";
                          }
                          if (ninenovalue != "-") {
                            bettingnumber += "9,";
                            bettingamount += ninenovalue + ",";
                          }
                          var amtfinal = bettingamount.split(","); //
                          int x = 0;
                          amtfinal.forEach((element) {
                            if (element != "" && element != "_") {
                              x += int.parse(element);
                            }
                          });

                          if (int.parse(universaldata.walletbalance) < x) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return recharge();
                            }));
                          } else {
                            universaldata.tempcoin = x.toString();
                            var req = await http
                                .get(Uri.parse("http://singlekadouble.iotans"
                                        ".in/apigame/customerplaygame?cid=" +
                                    universaldata.cid +
                                    "&gid=" +
                                    universaldata.gid +
                                    "&bettingnumber=" +
                                    bettingnumber +
                                    "&bettingamount=" +
                                    bettingamount));

                            if (req.body.contains('Saved')) {
                              var req1 = await http
                                  .get(Uri.parse("http://singlekadouble.iotans"
                                          ".in/api/wdebitamount?cid=" +
                                      universaldata.cid +
                                      "&wcoins=" +
                                      universaldata.tempcoin));
                              var reqq = await http.get(Uri.parse('http://singlekadouble.iotans'
                                  '.in/api/wbalance?cid=' +
                                  universaldata.cid));
                              setState(() {
                                universaldata.walletbalance = reqq.body;
                                print("VALUE" + reqq.body);
                              });
                              Fluttertoast.showToast(
                                  msg: "Your details have saved!",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 13.0);

                              return;
                            } else {
                              Fluttertoast.showToast(
                                  msg: "No. not saved!Please try again?",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 13.0);
                              // Navigator.pop(context);
                              return;
                            }
                          }
                        }

                        getdata();
                      },
                    ),
                    Padding(padding: EdgeInsets.only(right: 20.0)),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.teal, width: 2.0)))),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            fontSize: 25.0, fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // intParse(String walletcoins) {}
  // intParse1(String battingamount) {}
}

class Countdown extends AnimatedWidget {
  Countdown({required Key key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    var time = timerText.split(":");
    if (time[0] == "0") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => onsubmit()));
      });
    }

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
