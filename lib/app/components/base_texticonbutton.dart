import 'package:flutter/cupertino.dart';

class BaseTextIconButton extends StatelessWidget {
  const BaseTextIconButton({
    super.key,
    required this.icon,
    required this.text,
    this.mainAxisAlignment,
    this.size,
    this.color,
    this.onPressed,
  });

  final IconData icon;
  final String text;
  final MainAxisAlignment? mainAxisAlignment;
  final double? size;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: Alignment.center,
      minSize: 25,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
