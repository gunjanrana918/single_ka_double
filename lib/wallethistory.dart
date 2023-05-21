import 'package:flutter/material.dart';
import 'package:single_ka_double/creditwallethistory.dart';
import 'package:single_ka_double/debitwallethistory.dart';

import 'recahrgescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: wallethistory(),
    ));

class wallethistory extends StatefulWidget {
  const wallethistory({Key? key}) : super(key: key);

  @override
  _wallethistoryState createState() => _wallethistoryState();
}

class _wallethistoryState extends State<wallethistory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Wallet History'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) {
                return recharge();
              }));
            },
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            indicatorWeight: 3.0,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                text: 'Credit history',
              ),
              Tab(
                text: 'Debit history',
              ),
            ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('custom/backgroundimage.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            credtwallet(),
            debitwallet(),
          ],
        ),
      ),
    );
  }
}
