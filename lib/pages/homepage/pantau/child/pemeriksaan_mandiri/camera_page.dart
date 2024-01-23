import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;
  bool _isFlashOn = false;
  String imagePath = '';
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    onNewCameraSelected(cameras[1]);

    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  //use camera falsh
  void toggleFlash() async {
    try {
      if (controller != null) {
        final bool currentFlash =
            controller!.value.flashMode == FlashMode.torch;
        final FlashMode newFlashMode =
            currentFlash ? FlashMode.off : FlashMode.torch;

        await controller!.setFlashMode(newFlashMode);
        setState(() {
          _isFlashOn = !currentFlash;
        });
      }
    } on CameraException catch (e) {
      print('Error toggling flash: $e');
    }
  }

  //take picture user
  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  //take picture from user gallery
  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          imagePath = pickedFile.path;
        });

        handleResultPage(imagePath);
      }
    } catch (e) {
      print('Error picking image from gallery: ${e.toString()}');
    }
  }

  //navigate to result page ML
  handleResultPage(String path) {
    Navigator.pushReplacementNamed(
      context,
      addDataMandiri,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          addDataMandiri,
        );
      },
      child: Scaffold(
          body: _isCameraInitialized
              ? Column(
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1 / controller!.value.aspectRatio,
                        child: Stack(children: [
                          controller!.buildPreview(),
                          SafeArea(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 25),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                toggleFlash();
                                              },
                                              icon: Icon(
                                                _isFlashOn
                                                    ? Icons.flash_on
                                                    : Icons.flash_off,
                                                color: orangeColor,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  addDataMandiri,
                                                  (route) => false,
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.close_sharp,
                                                color: orangeColor,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      color: whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () async {
                                await pickImageFromGallery();
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.image_outlined,
                                  color: whiteColor,
                                ),
                              )),
                          InkWell(
                              onTap: () async {
                                XFile? rawImage = await takePicture();
                                File imageFile = File(rawImage!.path);

                                handleResultPage(rawImage.path);

                                int currentUnix =
                                    DateTime.now().millisecondsSinceEpoch;
                                final directory =
                                    await getApplicationDocumentsDirectory();
                                String fileFormat =
                                    imageFile.path.split('.').last;

                                await imageFile.copy(
                                  '${directory.path}/$currentUnix.$fileFormat',
                                );
                              },
                              child: const Icon(
                                Icons.camera,
                                color: orangeColor,
                                size: 34,
                              )),
                          InkWell(
                              onTap: () async {
                                setState(() {
                                  _isCameraInitialized = false;
                                });
                                onNewCameraSelected(
                                  cameras[_isRearCameraSelected ? 0 : 1],
                                );
                                setState(() {
                                  _isRearCameraSelected =
                                      !_isRearCameraSelected;
                                });
                              },
                              child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: orangeColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.camera_front_outlined,
                                    color: whiteColor,
                                  ))),
                        ],
                      ),
                    )
                  ],
                )
              : Container()),
    );
  }
}
