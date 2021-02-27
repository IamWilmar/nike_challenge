import 'package:flutter/material.dart';

class SideTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  const SideTransition({
    Key key,
    this.duration = const Duration(milliseconds: 900),
    @required this.child,
    this.offset = 300,
    this.axis = Axis.horizontal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.easeOut,
      tween: Tween(begin: -2.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal ? Offset(value * offset, 1.0) : Offset(1.0, value*offset),
          child: child,
        );
      },
    );
  }
}
