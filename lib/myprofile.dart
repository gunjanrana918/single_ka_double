import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:single_ka_double/universaldata.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profie(),
    ));

class profie extends StatefulWidget {
  @override
  _profieState createState() => _profieState();
}

class _profieState extends State<profie> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MY PROFILE',
            style: TextStyle(color: Colors.white),
          ),
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
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10.0, left: 40.0)),
                    Text(
                      'Personal Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    /******player name*******/
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player Name',
                          // textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    //   /*****player name****/
                    Padding(
                        padding: EdgeInsets.only(
                      top: 20.0,
                    )),
                    Text(
                      'Mobile',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.loginid,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 5.0,
                    )),
                    Divider(
                      height: 2,
                      thickness: 2,
                    ),

                    //Bank details******
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bank Details',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      'Bank account name',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    //   /*****player name****/
                    Padding(
                        padding: EdgeInsets.only(
                      top: 20.0,
                    )),
                    Text(
                      'Bank name',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.bankname,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      'Branch name',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.branchname,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      'Account no',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.accountno,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      'Bank IFSC code',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10.0,
                    )),
                    Text(
                      universaldata.bankifsccode,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
