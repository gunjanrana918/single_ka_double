import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:single_ka_double/recahrgescreen.dart';
import 'package:single_ka_double/universaldata.dart';

import 'node_debitwallet.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: debitwallet(),
    ));

class debitwallet extends StatefulWidget {
  const debitwallet({Key? key}) : super(key: key);

  @override
  _debitwalletState createState() => _debitwalletState();
}

int rindex = 0;

class _debitwalletState extends State<debitwallet> {
  List<Nodedebit> _nodes = [];

  Future<List<Nodedebit>> getdata() async {
    var req = await http.get(Uri.parse('http://singlekadouble.iotans'
            '.in/api/wgetdebit?cid=' +
        universaldata.cid));

    // ignore: deprecated_member_use
    var nodesJson = List<Map<String, dynamic>>.from(json.decode(req.body));
    List<Nodedebit> nodes = [];
    rindex = 0;
    for (var nodeJson in nodesJson) {
      rindex++;
      String wid = nodeJson["wid"].toString();
      String cid = nodeJson["cid"].toString();
      String date = nodeJson["wcreatedate"].toString();
      String walletcoins = nodeJson["wcoins"].toString();
      nodes.add(new Nodedebit(
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
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10.0, left: 10.0, right: 10.0),
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
