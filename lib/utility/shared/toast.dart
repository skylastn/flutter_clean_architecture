import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';

class Toast {
  static void showInfoSnackbar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title, message,
      backgroundColor: Colors.greenAccent,
      colorText: Colors.white,
      overlayColor: Colors.greenAccent,
      snackStyle: SnackStyle.floating,
      animationDuration: const Duration(seconds: 2),
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.info),
      // borderColor: Colors.greenAccent
    );
  }
}
