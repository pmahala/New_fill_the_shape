import 'package:flutter/material.dart';

class BorderedBoxArea extends StatelessWidget {
  final Widget borderBoxChild;

  BorderedBoxArea({this.borderBoxChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3C6EE7),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: borderBoxChild,
    );
  }
}
