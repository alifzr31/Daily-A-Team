import 'package:dailyateam/app/components/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    Key? key,
    required this.title,
    required this.secondTitle,
    required this.image,
    required this.titleContent,
    required this.description,
  }) : super(key: key);

  final String title;
  final String secondTitle;
  final String image;
  final String titleContent;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseText(
            text: title,
            color: Colors.white,
            size: 20,
            bold: FontWeight.w600,
          ),
          BaseText(
            text: secondTitle,
            color: Colors.white,
            size: 24,
            bold: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            width: Get.width,
            child: SvgPicture.asset(
              image,
              width: 180,
            ),
          ),
          const SizedBox(height: 40),
          BaseText(
            text: titleContent,
            color: Colors.white,
            bold: FontWeight.w500,
            textAlign: TextAlign.center,
            size: 16,
          ),
          const SizedBox(height: 5),
          BaseText(
            text: description,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
