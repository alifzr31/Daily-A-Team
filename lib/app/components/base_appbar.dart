import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dailyateam/app/components/base_text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    required this.title,
    this.height,
    this.action,
    this.bottom,
    this.bgColor,
    this.fgColor,
    this.withBorderRadius = false,
  }) : super(key: key);

  final String title;
  final double? height;
  final List<Widget>? action;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final Color? fgColor;
  final bool withBorderRadius;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return withBorderRadius
        ? Material(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            elevation: 1,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: AppBar(
              scrolledUnderElevation: 0,
              title: BaseText(
                text: title,
                bold: FontWeight.w500,
              ),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              backgroundColor: bgColor,
              foregroundColor: fgColor,
              bottom: bottom,
              actions: action,
            ),
          )
        : AppBar(
            scrolledUnderElevation: 0,
            title: BaseText(
              text: title,
              bold: FontWeight.w500,
            ),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            bottom: bottom,
            actions: action,
          );
  }
}

class BaseCustomTitleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BaseCustomTitleAppBar({
    Key? key,
    this.leading,
    this.title,
    required this.preferredSize,
    this.action,
    this.bottom,
    this.bgColor,
    this.fgColor,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  @override
  final Size preferredSize;
  final List<Widget>? action;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: title,
      centerTitle: true,
      elevation: 0,
      leading: leading,
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      bottom: bottom,
      actions: action,
    );
  }
}
