import 'package:flutter/material.dart';
import 'AnimationWidgetStack.dart';
import 'dart:math';

class ActualGame extends StatefulWidget {
  final Function(bool, List<bool>, int) onClick;

  ActualGame({@required this.onClick});

  @override
  _ActualGameState createState() => _ActualGameState();
}

class _ActualGameState extends State<ActualGame>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  double _left, _top;

  bool _sizeMatched = false;
  int currentImage = 1;

  List<bool> _responseTracker = [];
  int _attempts = 0;
  FrameType currentFrame = FrameType.Normal;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      lowerBound: 0.25,
      upperBound: 0.75,
      duration: Duration(seconds: 8),
      vsync: this,
    )..addListener(() {
        if (_animationController.view.value > 0.59 &&
            _animationController.view.value < 0.61) {
          setState(() {
            currentFrame = FrameType.Highlight;
          });
        } else {
          setState(() {
            currentFrame = FrameType.Normal;
          });
        }
      });
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _sizeMatched = false;
              _responseTracker.add(false);

              setState(() {
                widget.onClick(_sizeMatched, _responseTracker, _attempts);
              });
            }
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isAnimating) {
          _animationController.stop();
          // print(_animationController.view.value);
          if (_animationController.view.value >= 0.59 &&
              _animationController.view.value < 0.61) {
            _sizeMatched = true;
            _responseTracker.add(true);
          } else {
            _sizeMatched = false;
            _responseTracker.add(false);
          }
        }
        setState(() {
          widget.onClick(_sizeMatched, _responseTracker, _attempts);
        });
      },
      onDoubleTap: () {
        if (_attempts < 9 && !_animationController.isAnimating) {
          _attempts++;
          setState(() {
            _top = (350 * Random().nextDouble()) - 50; //(-50, 300)
            _left = (250 * Random().nextDouble()) - 50; //(-50, 200)
            currentImage = 1 + Random().nextInt(6);
          });
          _animationController.reset();
          _animationController.forward();
        }
      },
      child: Stack(
        children: [
          Positioned(
            top: _top, // 0 - 450
            left: _left, // 0 - 170
            width: 240,
            child: AnimationWidgetStack(
              choice: currentFrame,
              animation: _animation,
              outlineImageScale: 0.6,
              highlightImageScale: 0.7,
              filePath: 'images/image$currentImage.png',
            ),
          )
        ],
      ),
    );
  }
}
