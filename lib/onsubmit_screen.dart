import 'dart:async';
import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:single_ka_double/homescreen.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:single_ka_double/winningnumber.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onsubmit(),
    ));

class onsubmit extends StatefulWidget {
  const onsubmit({Key? key}) : super(key: key);

  @override
  _onsubmitState createState() => _onsubmitState();
}

class _onsubmitState extends State<onsubmit>  with TickerProviderStateMixin  {
  Future <void> winmsg() async {
    var req = await http.get(Uri.parse("http://singlekadouble.iotans"
        ".in/apigame/winnermessage?cid=" +
        universaldata.cid +
        "&gid=" +
        universaldata.gid +
        "&gopennumber=" +
        universaldata.winnumber
    ));
    var res = jsonDecode(req.body).toString();
    if (res == "!! CONGRATULATION! YOU ARE WINNER !!") {
      Fluttertoast.showToast(
          msg: "CONGRATULATION! YOU ARE WINNER",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
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
      Fluttertoast.showToast(
          msg: "SORRY! NEXT TIME BETTER LUCK",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return homescreen();
      }));
    }
  }
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.yellow,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 100,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  late AnimationController _controller;
  late VideoPlayerController _playerController;
  @override
  void initState() {
    super.initState();
    // startTime();
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 2));
    _controller.forward();
    _playerController = VideoPlayerController.asset('custom/winvideo.mp4')
      ..initialize().then((_) {
        _playerController.play();
        _playerController.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    //_playerController.dispose();
    super.dispose();
  }

  TextEditingController _textInputController = TextEditingController();
  String _showText = " ";

  _onPressed() {
    setState(() {
      _showText = _textInputController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool animated = false;
    return Scaffold(
        appBar: AppBar(
          title: Text(universaldata.gname),
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
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Row(
                  children: [
                    Center(
                      child: SizedBox(
                          height: 30.0,
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                      'Result will show after 2 Min.')
                                ],
                                totalRepeatCount: 03,
                                stopPauseOnTap: true,
                              ))),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularCountDownTimer(
                      fillColor: Colors.green,
                      ringColor: Colors.redAccent,
                      duration: 120,
                      strokeWidth: 5.0,
                      initialDuration: 0,
                      isReverse: false,
                      isTimerTextShown: true,
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height / 3.5,
                      onComplete: () async {
                        var req = await http
                            .get(Uri.parse("http://singlekadouble.iotans"
                                    ".in/apigame/winnumber?gid=" +
                                universaldata.gid));
                        universaldata.winnumber = req.body;
                        setState(() {
                          _showText = "Win Number is" + universaldata.winnumber;
                          winmsg();
                          //*****************//
                          /////*************//
                        });
                      },
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 5.0)),
                    Text(
                      universaldata.gid,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Image.network(
                      'http://singlekadouble'
                              '.iotans.in/uploaddocs/gameimage/' +
                          universaldata.gimage,
                      height: 150,
                      width: 150,
                    ),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child:
                          AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText(
                                    '$_showText',
                              textStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 60,)

                                )

                              ])
                        )
                  
                        // Stack(
                        //   children: [
                        //     AnimatedBackground(
                        //       vsync: this,
                        //       behaviour: RandomParticleBehaviour(options: particles),
                        //       child: Text('$_showText',
                        //         softWrap: true,
                        //         style: TextStyle(fontSize: 90.0),),
                        //     )
                        //     // // SizedBox.expand(
                        //     // //   child: FittedBox(
                        //     // //     fit: BoxFit.cover,
                        //     // //     alignment: Alignment.bottomCenter,
                        //     // //     child: SizedBox(
                        //     // //       width: _playerController.value.size.width,
                        //     // //       height: _playerController.value.size.height,
                        //     // //       child: VideoPlayer(_playerController),
                        //     // //     ),
                        //     // //   ),
                        //     // // ),
                        //     // Center(
                        //     //   child:
                        //     //   AnimatedBackground(
                        //     //     vsync: this,
                        //     //     behaviour: RandomParticleBehaviour(options: particles),
                        //     //     child: Text('$_showText',
                        //     //     softWrap: true,
                        //     //     style: TextStyle(fontSize: 90.0),),
                        //     //   )
                        //     //
                        //     // )
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
  //for kill this screen after sometime//
  startTime() async {
    var duration = new Duration(seconds: 120);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => homescreen()
    )
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({required this.animation}) : super(listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) async {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      "$timerText",
      style: TextStyle(
          fontSize: 40,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );
  }
}
