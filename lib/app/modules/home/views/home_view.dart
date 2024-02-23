import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  // Define a map to associate route names with icons
  final Map<String, IconData> routeIcons = {
    'profile': Icons.person,
    'counter': Icons.add_circle,
    'formulir': Icons.description,
    'payment': Icons.payment,
    'collection': Icons.collections,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Tampilkan konfirmasi logout di sini
              controller.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            // Create ElevatedButton for each route
            for (var route in routeIcons.keys)
              ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed(route);
                },
                icon: Icon(routeIcons[route]), // Set icon based on route
                label: Text(
                  ' $route page',
                  style: TextStyle(fontSize: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
} 