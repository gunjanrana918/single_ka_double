import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:http/http.dart' as http;

import 'homescreen.dart';
void main(){
  runApp(MaterialApp(

  ));
}
class share$earn extends StatefulWidget {
  const share$earn({Key? key}) : super(key: key);

  @override
  State<share$earn> createState() => _share$earnState();
}

class _share$earnState extends State<share$earn> {
  var res;
  var result;
  Future<void> getdata() async {
    var req = await http.get(Uri.parse('http://singlekadouble.iotans'
        '.in/api/shareearn?cid=' +
        universaldata.cid));
    res = req.body;
    result = jsonDecode(res);
    if(result =='success'){
      Fluttertoast.showToast(
          msg: universaldata.coins + " " + "will be added as Reward Points",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 13.0);
      return;
    }
    else {
      Fluttertoast.showToast(
          msg: "Please try after sometime",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 13.0);
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => homescreen()));


    // universaldata.coins = req.body;
    // print(universaldata.cid);
    // print(req.body);
    // print('VALUE' + universaldata.coins);
  }
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
    getdata();
  }

  final String _content =
      'http://singlekadouble.com/';
  void _shareContent() {
    Share.share(_content);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite Friends'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('custom/backgroundimage.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Text(_content,style: TextStyle(fontSize: 17.0),),
            SizedBox(height: 15),
            ElevatedButton.icon(
                onPressed: _shareContent,

                icon: Icon(Icons.share),
                label: Text('Share The App'))
          ]),
        ),

            ) ],
        ),

      ),
    );
  }
}
