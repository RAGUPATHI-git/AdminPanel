import 'package:adminpanel/common/layouts/pop_ups/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 240,
                  ),
                  AnimationLoader(
                    text: text,
                    animation: animation,
                  )
                ],
              ),
            )));
  }

  static void popUpCircular() {
    Get.defaultDialog(
        title: '',
        onWillPop: () async => false,
        content: const CircularProgressIndicator(),
        backgroundColor: Colors.transparent);
  }

  //This method stop the loading

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
