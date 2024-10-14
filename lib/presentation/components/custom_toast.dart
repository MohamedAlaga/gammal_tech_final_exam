import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

void showGreenToast(String message) {
  toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      title:
          const Text('Login Successful', style: TextStyle(color: Colors.white)),
      type: ToastificationType.success,
      alignment: Alignment.bottomCenter,
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: const Color(0xff094546),
      primaryColor: Colors.white,
      progressBarTheme: const ProgressIndicatorThemeData(
          linearTrackColor: Color.fromARGB(255, 194, 194, 194),
          color: Colors.white));
}

void showRedToast(String message) {
  toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(message, style: const TextStyle(color: Colors.white)),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter);
}
