import 'package:flutter/material.dart';

enum FrameType { Normal, Highlight }

class AnimationWidgetStack extends StatelessWidget {
  final Animation animation;
  final double outlineImageScale;
  final double highlightImageScale;
  final String filePath;
  final FrameType choice;

  AnimationWidgetStack(
      {@required this.animation,
      @required this.outlineImageScale,
      @required this.highlightImageScale,
      @required this.filePath,
      @required this.choice});

  List<Widget> getWidgetList(FrameType choice) {
    List<Widget> state1, state2;

    state1 = <Widget>[
      Transform.scale(
        scale: outlineImageScale,
        child: Image.asset(
          filePath,
          color: Colors.pink,
        ),
      ),
      ScaleTransition(
        scale: animation,
        alignment: Alignment.center,
        child: Image.asset(filePath),
      ),
    ];

    state2 = <Widget>[
      Transform.scale(
        scale: outlineImageScale,
        child: Image.asset(
          filePath,
          color: Colors.pink,
        ),
      ),
      Transform.scale(
        scale: highlightImageScale,
        child: Image.asset(
          filePath,
          color: Colors.purple,
        ),
      ),
      ScaleTransition(
        scale: animation,
        alignment: Alignment.center,
        child: Image.asset(filePath),
      ),
    ];

    if (choice == FrameType.Normal)
      return state1;
    else
      return state2;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: getWidgetList(choice),
    );
  }
}
