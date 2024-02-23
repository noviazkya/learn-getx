import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Future<void> logout() async {
    // Hapus token dari Shared Preferences
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');

    // Redirect ke halaman login setelah logout
    Get.offAllNamed('/login');
  }
}
