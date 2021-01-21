import 'package:flutter/material.dart';

class Message {
  static void showSnackBarMessage(GlobalKey<ScaffoldState> key,String msg) {
    SnackBar snackBar = new SnackBar(content: new Text(msg));
    key.currentState.showSnackBar(snackBar);
  }
}
