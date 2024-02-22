import 'package:dailyateam/app/components/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    required this.label,
    this.bgColor,
    this.color,
    this.shape,
    this.onPressed,
  }) : super(key: key);

  final String icon;
  final String label;
  final Color? bgColor;
  final Color? color;
  final OutlinedBorder? shape;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(bgColor),
            shape: MaterialStatePropertyAll(shape),
          ),
          color: color,
          icon: SvgPicture.asset(
            'assets/images/$icon',
            width: label == 'Break Time' ? 19 : 23,
          ),
          onPressed: onPressed,
        ),
        BaseText(
          text: label,
          size: 12,
        ),
      ],
    );
  }
}
