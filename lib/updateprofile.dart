import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:single_ka_double/universaldata.dart';

import 'homescreen.dart';
import 'myprofile.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: updateprofile(),
    ));

class updateprofile extends StatefulWidget {
  const updateprofile({Key? key}) : super(key: key);

  @override
  _updateprofileState createState() => _updateprofileState();
}

class _updateprofileState extends State<updateprofile> {
  @override
  void initState() {
    citycontroller.text = universaldata.city;
    print(universaldata.city);
    banknamecontroller.text = universaldata.bankname;
    branchnamecontroller.text = universaldata.branchname;
    bankaccountcontroller.text = universaldata.accountno;
    bankifsccontroller.text = universaldata.bankifsccode;
    super.initState();
  }

  final citycontroller = TextEditingController();
  final banknamecontroller = TextEditingController();
  final branchnamecontroller = TextEditingController();
  final bankaccountcontroller = TextEditingController();
  final bankifsccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update profile'),
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
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  'Update Bank Details',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  'City',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                TextFormField(
                  controller: citycontroller,
                  decoration: InputDecoration(
                      labelText: universaldata.city.replaceAll(":", ""),
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  'Bank name',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                TextFormField(
                  controller: banknamecontroller,
                  decoration: InputDecoration(
                      labelText: universaldata.bankname.replaceAll(":", ""),
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  'Branchname name',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                TextFormField(
                  controller: branchnamecontroller,
                  decoration: InputDecoration(
                      labelText: universaldata.branchname.replaceAll(":", ""),
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  'Account no.',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                TextFormField(
                  controller: bankaccountcontroller,
                  decoration: InputDecoration(
                      labelText: universaldata.accountno.replaceAll(":", ""),
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  'Bank IFSC',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                TextFormField(
                  controller: bankifsccontroller,
                  decoration: InputDecoration(
                      labelText: universaldata.bankifsccode.replaceAll(
                          ":",
                          ""
                              ""),
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                                  BorderSide(color: Colors.teal, width: 2.0)))),
                  child: Text(
                    'Update',
                    style:
                        TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
                  ),
                  onPressed: () {
                    Future<void> getdata() async {
                      var req = await http
                          .get(Uri.parse('http://singlekadouble.iotans'
                                  '.in/api/cupdateprofile?ccity=' +
                              citycontroller.text.replaceAll(" ", "%20") +
                              '&cbankname=' +
                              banknamecontroller.text.replaceAll(" ", "%20") +
                              '&cbranchname=' +
                              branchnamecontroller.text.replaceAll(" ", "%20") +
                              '&caccountno=' +
                              bankaccountcontroller.text.replaceAll(" ", "%20""") +
                              '&cifsccode=' + bankifsccontroller.text.replaceAll(" ", "%20") +
                              '&cid=' +
                              universaldata.cid +
                              ''));

                      if (req.body.contains("Bank details save Successfully")) {
                        Fluttertoast.showToast(
                            msg: "Bank details updated Successfully.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0);
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profie()));
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homescreen()));

                        return;
                      }
                    }

                    getdata();
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
