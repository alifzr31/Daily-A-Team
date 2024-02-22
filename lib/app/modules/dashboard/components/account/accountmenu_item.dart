import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.title,
    required this.menuItems,
  });

  final String title;
  final List<Widget> menuItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: title,
          bold: FontWeight.w600,
          color: navyColor,
        ),
        const SizedBox(height: 5),
        Material(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: menuItems,
          ),
        ),
      ],
    );
  }
}
