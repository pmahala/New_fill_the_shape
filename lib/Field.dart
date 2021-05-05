import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign;

  Field({@required this.label, @required this.value, @required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: 12),
            textAlign: textAlign,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}
