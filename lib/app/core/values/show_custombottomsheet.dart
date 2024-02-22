import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomBottomSheet({double? height, Widget? child}) {
  Get.bottomSheet(
    backgroundColor: Colors.white,
    clipBehavior: Clip.antiAlias,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    SizedBox(
      height: height,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 8,
                width: Get.width * 0.13,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: child,
          ),
        ],
      ),
    ),
  );
}
