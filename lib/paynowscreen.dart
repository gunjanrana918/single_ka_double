import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: buynow(),
    ));

class buynow extends StatefulWidget {
  @override
  _buynowState createState() => _buynowState();
}

class _buynowState extends State<buynow> {
  final amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var url = 'https://app.vexch365.com/';
    // var url = 'http://singlekadouble.iotans.in/payment/Index?cid=' +
    //     universaldata.cid.replaceAll(":", "").replaceAll(" ", "") +
    //     '&cname=' +
    //     universaldata.name.replaceAll(":", "").replaceAll(" ", "") +
    //     '&cloginid=' +
    //     universaldata.loginid.replaceAll(":", "").replaceAll(" ", "") +
    //     '&wcoins=' +
    //     universaldata.walletcoins.replaceAll(" ", "");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recharge wallet",
        ),
        centerTitle: true,
      ),
      body:
          WebView(initialUrl: url, javascriptMode: JavascriptMode.unrestricted,
          ),
    );
  }
}
