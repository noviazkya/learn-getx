import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 1.obs;

  void increment() {
    if (count.value < 20) {
      count.value++;
    } else {
      // Menampilkan snackbar jika count melebihi 100
      Get.snackbar(
        '𝗪𝗮𝗿𝗻𝗶𝗻𝗴 !',
        '𝙣𝙪𝙢𝙗𝙚𝙧𝙨 𝙘𝙖𝙣𝙣𝙤𝙩 𝙚𝙭𝙘𝙚𝙚𝙙 20.',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        icon: Icon(Icons.notifications),
        backgroundColor: const Color.fromARGB(150, 158, 158, 158),
      );
    }
  }

  void decrease() {
    if (count.value > 1) {
      count.value--;
    } else {
      // Menampilkan snackbar jika count kurang dari 1
      Get.snackbar(
        '𝗪𝗮𝗿𝗻𝗶𝗻𝗴 !',
        '𝙩𝙝𝙚 𝙣𝙪𝙢𝙗𝙚𝙧 𝙘𝙖𝙣𝙣𝙤𝙩 𝙗𝙚 𝙡𝙚𝙨𝙨 𝙩𝙝𝙖𝙣 1.',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        icon: Icon(Icons.notifications),
        backgroundColor: const Color.fromARGB(150, 158, 158, 158),
      );
    }
  }
} 