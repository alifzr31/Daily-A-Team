import 'package:camera/camera.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:get/get.dart';

class MyCameraController extends GetxController {
  late CameraController camController;
  late Future<void> _initializeControllerFuture;
  RxBool isCameraReady = false.obs;
  final image = Rx<XFile?>(null);
  final imageSize = Rx<int?>(null);

  @override
  void onInit() {
    initializeCamera();
    super.onInit();
  }

  @override
  void onClose() {
    camController.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      List<CameraDescription> cameras = await availableCameras();

      CameraDescription selectedCamera = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
      );

      camController = CameraController(
        selectedCamera,
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = camController.initialize();

      _initializeControllerFuture.then((value) => isCameraReady.value = true);
    } catch (e) {
      failedSnackbar(
        'Failed Open Camera',
        'Something went wrong on your camera',
      );
    }
  }

  Future<void> takePicture() async {
    try {
      await _initializeControllerFuture;

      image.value = await camController.takePicture();
      imageSize.value = await image.value?.length();
      Get.offAndToNamed(
        '/clockInOut',
        arguments: {
          'image': image.value,
          'imageSize': imageSize.value,
        },
      );
    } catch (e) {
      failedSnackbar(
        'Take a Picture Failed',
        'Something went wrong on your camera',
      );
    }
  }
}
