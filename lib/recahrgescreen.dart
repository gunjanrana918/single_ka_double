import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:single_ka_double/homescreen.dart';
import 'package:single_ka_double/universaldata.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: recharge(),
    ));

class recharge extends StatefulWidget {
  const recharge({Key? key}) : super(key: key);

  @override
  _rechargeState createState() => _rechargeState();
}

class _rechargeState extends State<recharge> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  FocusNode textFocusController = FocusNode();
  var msg;
  late String paymentId;
  late String orderId;


  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }
  // final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recharge your wallet'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('custom/backgroundimage.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: TextField(
                  focusNode: textFocusController,
                  cursorRadius: Radius.zero,
                  textAlign: TextAlign.center,
                  controller: textEditingController,
                  decoration: const InputDecoration(hintText: "Amount",),
                  style: const TextStyle(fontSize: 35.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text(
                    "Pay",
                    style: const TextStyle(color: Colors.white,fontSize: 20),
                  ),
                  onPressed: () {
                    universaldata.walletcoins = textEditingController.text;
                    openCheckout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void openCheckout() {
    var res = "";
    var options = {
      "key": 'rzp_live_y8FLXArzGbSU0Z',
      "amount": num.parse(textEditingController.text) * 100, // Convert Paisa to Rupees
      "name": "Single ka Double",
      "description": "Play Single Ka Double every day to earn free daily bonus. The more you play the more you earn",
      "timeout": "180",
      "theme.color": "#03be03",
      "currency": "INR",
      "prefill": {"contact": "7426887471", "email": "highmast.dev2016@gmail.com"},
      "external": {
        "wallets": ["paytm"]}
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> handlerPaymentSuccess(PaymentSuccessResponse response) async {
    universaldata.wpaymentid = response.paymentId!;
    msg = "Payment Successfull" ;
    showToast(msg);
    var req = await http.get(Uri.parse('http://singlekadouble.iotans.in/api/wcreditamount?cid=' +
        universaldata.cid + '&wcoins=' + universaldata.walletcoins + '&wpaymentid='+ universaldata.wpaymentid));
    var parsedJson = req.body;
    if (parsedJson == "Saved"){
      var req1 = await http.get(Uri.parse('http://singlekadouble.iotans.in/api/wbalance?cid=' + universaldata.cid));
      universaldata.walletbalance = req1.body;
      msg = "Wallet recharge successfully with Rs. " + universaldata.walletcoins;
      showToast(msg);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => homescreen()));
    } else {
      msg = 'Internal Error';
      showToast(msg);
    }
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    msg = "Payment failed! Please try again";
    showToast(msg);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    msg = "INTERNAL ERROR! TRY AFTER SOMETIME" ;
    showToast(msg);
  }

  showToast(msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 18.0,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      textColor: Colors.red,
    );
  }
}
// class PaymentSuccessResponse {
//   String paymentId;
//   String orderId;
//
//   PaymentSuccessResponse(this.paymentId, this.orderId,);
//
//   static PaymentSuccessResponse fromMap(Map<dynamic, dynamic> map) {
//     String paymentId = map["razorpay_payment_id"];
//     String orderId = map["razorpay_order_id"];
//
//     return new PaymentSuccessResponse(paymentId, orderId,);
//   }
// }
