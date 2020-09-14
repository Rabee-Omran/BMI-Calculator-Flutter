
import 'package:flutter/material.dart';
import '../constans.dart';



class BottomButtom extends StatelessWidget {
  final Function onTap;
  final String buttomTitle;

  const BottomButtom({this.onTap, this.buttomTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Center(
            child: Text(
          buttomTitle,
          style: claculateStyle,
        )));
  }
}