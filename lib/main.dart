import 'package:belajar_getx/app/modules/collection/controllers/collection_controller.dart';
import 'package:belajar_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
  Get.put(HomeController());
  Get.put(CollectionController());
}
