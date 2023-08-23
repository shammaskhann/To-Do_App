import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class toastmessage {
  toastMessage(String mesg) {
    Fluttertoast.showToast(
        msg: mesg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white.withOpacity(0.5),
        textColor: Colors.black,
        fontSize: 16.0);
  }
}