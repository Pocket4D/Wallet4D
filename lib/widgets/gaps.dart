import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(
    this.width, {
    Key? key,
    this.color,
  }) : super(key: key);

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget _w = SizedBox(width: width);
    if (color != null) {
      _w = ColoredBox(color: color!, child: _w);
    }
    return _w;
  }
}

class VGap extends StatelessWidget {
  const VGap(
    this.height, {
    Key? key,
    this.color,
  }) : super(key: key);

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget _w = SizedBox(height: height);
    if (color != null) {
      _w = ColoredBox(color: color!, child: _w);
    }
    return _w;
  }
}
