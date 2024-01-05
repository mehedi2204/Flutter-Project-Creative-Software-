import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnakebar(
    {required String? title,
    required String? description,
    required Color? color,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    required IconData? icon}) {
  Get.snackbar(
    title.toString(),
    description.toString(),
    icon: Icon(icon, color: Colors.white),
    snackPosition: snackPosition,
    backgroundColor: color,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 5),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
