import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class BreaktimeButton extends StatelessWidget {
  const BreaktimeButton({
    super.key,
    required this.label,
    required this.icon,
    this.labelColor,
    this.iconColor,
    this.bgColor,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final Color? labelColor;
  final Color? iconColor;
  final Color? bgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(5),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: navyColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: BaseText(
                  text: label,
                  bold: FontWeight.w500,
                  color: labelColor,
                ),
              ),
              Icon(
                icon,
                color: iconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
