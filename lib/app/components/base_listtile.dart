import 'package:dailyateam/app/components/base_text.dart';
import 'package:flutter/material.dart';

class BaseListTile extends StatelessWidget {
  const BaseListTile({
    Key? key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
    this.tileColor,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      dense: true,
      horizontalTitleGap: 15,
      tileColor: tileColor,
      leading: leading,
      title: BaseText(
        text: title,
        maxLines: 2,
        size: 14,
        overflow: TextOverflow.ellipsis,
        bold: FontWeight.w500,
      ),
      subtitle: BaseText(
        text: subtitle,
        size: 12,
        color: Colors.grey.shade600,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
