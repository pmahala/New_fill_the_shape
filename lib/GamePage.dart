import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ActualGame.dart';
import 'package:fill_the_shape/BorderedBoxArea.dart';
import 'Field.dart';

List<Widget> initial = [
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
  Expanded(
    child: Icon(
      Icons.adjust_outlined,
      color: Color(0xFF7B7676),
      size: 25.0,
    ),
  ),
];

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Widget> widgetList = initial;

  int levelNumber = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Field(
                      label: 'Level:',
                      value: levelNumber.toString(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Field(
                      label: 'Score:',
                      value: '0',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Field(
                      label: 'Time(seconds):',
                      value: '3',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 70, right: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widgetList,
                ),
              ),
            ),
            Expanded(
              child: BorderedBoxArea(
                borderBoxChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Tap to stop the expanding figure'),
                    Text('Double tap to take another attempt'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: BorderedBoxArea(
                borderBoxChild: ActualGame(
                  onClick: (val, val2, attempt) {
                    if (val == true) {
                      print('Size Matched!!');
                    } else {
                      print('Size Did not match');
                    }
                    print(val2);
                    print(attempt);

                    setState(
                      () {
                        for (int i = 0; i < val2.length; i++) {
                          if (val2[i]) {
                            widgetList[i] = Expanded(
                              child: Icon(
                                Icons.check_circle,
                                size: 25.0,
                                color: Colors.green,
                              ),
                            );
                          } else if (!val2[i]) {
                            widgetList[i] = Expanded(
                              child: Icon(
                                Icons.cancel_rounded,
                                size: 25.0,
                                color: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                    );
                    //widgetList = [];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
