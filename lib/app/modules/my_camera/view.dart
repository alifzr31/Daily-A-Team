import 'package:camera/camera.dart';
import 'package:dailyateam/app/modules/my_camera/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class MyCameraPage extends StatelessWidget {
  const MyCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCameraBody(),
    );
  }
}

class MyCameraBody extends StatelessWidget {
  MyCameraBody({super.key});
  final controller = Get.find<MyCameraController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          controller.isCameraReady.isFalse
              ? const Center(
                  child: CupertinoActivityIndicator(color: Colors.white))
              : CameraPreview(
                  controller.camController,
                ),
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: Material(
                color: const Color(0xFF111011),
                child: Center(
                  child: IconButton(
                    onPressed: controller.takePicture,
                    icon: const Icon(
                      MingCute.camera_2_line,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
