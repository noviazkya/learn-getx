import 'package:belajar_getx/app/modules/collection/views/collection_view.dart';
import 'package:belajar_getx/app/modules/home/views/home_view.dart';
import 'package:belajar_getx/app/modules/payment/views/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ButtonNavigationView extends StatelessWidget {
  ButtonNavigationView({Key? key}) : super(key: key);

  final _selectedTab = 0.obs;

  final List<Widget> _pages = [HomeView(), CollectionView(), PaymentView()];

  _changeTab(int index) {
    _selectedTab.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_selectedTab.value]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab.value,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_stream), label: "Collection"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Payment")
        ],
      ),
    );
  }
}