import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tynenger_flutter_getx_firebase_chat/app/modules/home/controllers/home_controller.dart';

class SettingsScreenController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool isNotificationsEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadDarkModePreference();
  }

  Future<void> _loadDarkModePreference() async {
    final prefs = await SharedPreferences.getInstance();
    bool storedDarkMode = prefs.getBool('isDarkMode') ?? false;
    isDarkMode.value = storedDarkMode;
    if (storedDarkMode) {
      Get.changeThemeMode(ThemeMode.dark);
      print("Dark Mode Enabled");
    } else {
      Get.changeThemeMode(ThemeMode.light);
      print("Light Mode Enabled");
    }
  }

  void toggleDarkMode(bool value) async {
    isDarkMode.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    if (value) {
      Get.changeThemeMode(ThemeMode.dark);
      print("Switched to Dark Mode");
    } else {
      Get.changeThemeMode(ThemeMode.light);
      print("Switched to Light Mode");
    }
    Get.find<HomeController>().navBarColor.value = value
        ? const Color(0xFF1E1E1E)
        : Colors.white;
    print("NavBar color updated in HomeController");
    print("isDarkMode: ${isDarkMode.value}");
    print(Get.find<HomeController>().navBarColor.value);
  }

  void toggleNotifications(bool value) {
    isNotificationsEnabled.value = value;
  }

  void logout() async {
    // Perform logout logic here
    await FirebaseAuth.instance.signOut();
    // For example, clear user session, tokens, etc.
    print("User logged out");
    // Navigate to login screen or initial screen
    Get.offAllNamed('/login-screen');
  }
}
