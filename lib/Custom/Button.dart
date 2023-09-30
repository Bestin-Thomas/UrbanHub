import 'package:flutter/material.dart';

import 'Paint.dart';



class FuturisticButton extends StatelessWidget {
  late final VoidCallback onPressed;
  final Color buttonColor;
  final double ?width; // Add a width attribute
  final double ?height; // Add a height attribute
  late final Widget child;

  FuturisticButton({
    required this.onPressed,
    this.buttonColor=const Color(0xFF7B61FF),
    required this.child,
    this.width=126, // Default width
    this.height=55, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height!, // Set the height using the provided attribute
        width: width!, // Set the width using the provided attribute
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: height!*.22,
              top: 0,
              bottom: 0,
              child: Container(
                width:width!*.9,
                height: height!,
                // margin: EdgeInsets.only(right: 12.0),
                color: buttonColor,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: height!*.22,
              child: Container(
                width: height!*.22,
                height: (height!*.78),
                color: buttonColor,
              ),
            ),
            Positioned(
              right: height!*.22,
              top: 0,
              bottom: 0,
              child: Container(
                width: height!*.22,
                height: height!,
                color: buttonColor,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: height!*.22,
                height: height!*.22,
                child: CustomPaint(
                  size: Size(height!*.22, height!*.22),
                  painter: TrianglePainter(buttonColor),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: child, // Display the provided child widget
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButtonWithIconText extends StatelessWidget {
  late final Widget image;
  final Color buttonColor;
  late final Widget child;
  final VoidCallback onPressed;
  final double?width;
  final double?height;

  CustomButtonWithIconText({
    required this.image,
    this.buttonColor=Colors.transparent,
    required this.child,
    required this.onPressed,
    this.width=65,
    this.height=50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: buttonColor,
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child: image, // Display the provided child widget
              ),
            SizedBox(height: 10),
            Center(
                child: child, // Display the provided child widget
              ),
          ],
        ),
      ),
    );
  }
}

