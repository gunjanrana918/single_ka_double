import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:single_ka_double/recahrgescreen.dart';
import 'package:single_ka_double/universaldata.dart';

import 'node_creditwallet.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: credtwallet(),
    ));

class credtwallet extends StatefulWidget {
  const credtwallet({Key? key}) : super(key: key);

  @override
  _credtwalletState createState() => _credtwalletState();
}

int rindex = 0;

class _credtwalletState extends State<credtwallet> {
  List<Nodecredit> _nodes = [];
  Future<List<Nodecredit>> getdata() async {
    var req = await http.get(Uri.parse('http://singlekadouble.iotans'
            '.in/api/wgetcredit/?cid=' +
        universaldata.cid));
    var nodesJson = List<Map<String, dynamic>>.from(json.decode(req.body));
    //print("body" + nodesJson);
    List<Nodecredit> nodes = [];

    rindex = 0;
    for (var nodeJson in nodesJson) {
      rindex++;
      String wid = nodeJson["wid"].toString();
      String cid = nodeJson["cid"].toString();
      String date = nodeJson["wcreatedate"].toString();
      String walletcoins = nodeJson["wcoins"].toString();

      nodes.add(new Nodecredit(
        wid,
        cid,
        date,
        walletcoins,
      ));
    }
    // }
    return nodes;
  }

  @override
  Widget build(BuildContext context) {
    getdata().then((value) {
      setState(() {
        if (!_nodes.contains(value)) _nodes.addAll(value);
      });
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
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
        child: ListView.builder(
          itemCount: rindex,
          itemBuilder: (context, index) {
            return Card(
                margin: EdgeInsets.all(5.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date : ' + _nodes[index].wcreatedate,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Coins : ' + _nodes[index].wcoins,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )));
          },
        ),
      ),
    );
  }
}
