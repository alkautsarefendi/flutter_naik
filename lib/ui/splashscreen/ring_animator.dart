import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

import 'package:flutter/services.dart';
import 'arc2_painter.dart';

class RingAnimator extends StatefulWidget {
  const RingAnimator(
      {required this.child,
      this.ringColor = Colors.deepOrange,
      this.ringAnimation = Curves.linear,
      this.ringAnimationInSeconds = 30,
      this.ringIconsSize = 3,
      this.size = 200,
      this.reverse = true,
      required this.ringIcons,
      this.ringIconsColor = Colors.black})
      : assert(child != null);

  final Widget child;
  final Color ringColor;
  final Curve ringAnimation;
  final int ringAnimationInSeconds;
  final double ringIconsSize;
  final double size;
  final bool reverse;
  final List<String> ringIcons;
  final Color ringIconsColor;

  @override
  _RingAnimatorState createState() => _RingAnimatorState();
}

class _RingAnimatorState extends State<RingAnimator>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  List<UI.Image> image = <UI.Image>[];

  @override
  void initState() {
    super.initState();
    initAnimations();
    initUiImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          _ringArc(),
          _child()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initAnimations() {
    controller = AnimationController(
        duration: Duration(seconds: widget.ringAnimationInSeconds),
        vsync: this);

    final _ringAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: widget.ringAnimation)));

    widget.reverse
        ? animation = ReverseAnimation(_ringAnimation)
        : animation = _ringAnimation;
    controller.repeat();
  }

  void initUiImages() async {
    for (var imageAssetPath in widget.ringIcons) {
      await _loadUiImage(imageAssetPath);
    }
  }

  Future _loadUiImage(String imageAssetPath) async {
    final data = await rootBundle.load(imageAssetPath);
    final bytes = data.buffer.asUint8List();
    final decodeImage = await decodeImageFromList(bytes);
    image.add(decodeImage);

    setState(() {
      image = image;
    });
  }

  Center _ringArc() {
    return Center(
      child: RotationTransition(
        turns: animation,
        child: CustomPaint(
          painter: Arc2Painter(
            color: widget.ringColor,
            iconsSize: widget.ringIconsSize,
            image: image,
            imageColor: widget.ringIconsColor
          ),
          child: Container(
            width: widget.size,
            height: widget.size,
          ),
        ),
      ),
    );
  }

  Center _child() {
    return Center(
      child: Container(
        width: widget.size * 0.7,
        height: widget.size * 0.7,
        child: widget.child,
      ),
    );
  }
}

