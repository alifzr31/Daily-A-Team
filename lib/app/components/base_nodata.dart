import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_texticonbutton.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.imageSize,
    this.showButton = true,
    this.onPressed,
  });

  final String image;
  final String title;
  final String subtitle;
  final double? imageSize;
  final bool showButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/$image',
            width: imageSize,
          ),
          const SizedBox(height: 15),
          BaseText(
            text: title,
            size: 16,
            bold: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          BaseText(
            text: subtitle,
            color: Colors.grey.shade600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: showButton,
            child: BaseTextIconButton(
              icon: MingCute.refresh_1_line,
              text: 'Refresh Data',
              size: 14,
              color: navyColor,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class BaseNoDataLottie extends StatelessWidget {
  const BaseNoDataLottie({
    super.key,
    required this.lottie,
    required this.title,
    required this.subtitle,
    this.lottieSize,
    this.showButton = true,
    this.onPressed,
  });

  final String lottie;
  final String title;
  final String subtitle;
  final double? lottieSize;
  final bool showButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lotties/$lottie',
            width: lottieSize,
            repeat: false,
            frameRate: FrameRate(144),
          ),
          const SizedBox(height: 15),
          BaseText(
            text: title,
            size: 16,
            bold: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          BaseText(
            text: subtitle,
            color: Colors.grey.shade600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: showButton,
            child: BaseTextIconButton(
              icon: MingCute.refresh_1_line,
              text: 'Refresh Data',
              size: 14,
              color: navyColor,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
