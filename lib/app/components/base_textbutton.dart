import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  const BaseTextButton({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.decoration,
    this.onPressed,
  });

  final String text;
  final double? size;
  final Color? color;
  final TextDecoration? decoration;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: Alignment.center,
      minSize: 25,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          decoration: decoration,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
