// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget(
      {required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 450)});
  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  void listen() {
    print('controller ${widget.controller}');
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    print('controller ${widget.controller}');

    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    print('controller ${widget.controller}');

    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  void initState() {
    print('controller ${widget.controller}');

    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        height: isVisible ? 70.0 : 0.0,
        duration: widget.duration,
        child: Wrap(
          children: [widget.child],
        ),
      );
}
