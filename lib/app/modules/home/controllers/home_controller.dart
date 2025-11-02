import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tynenger_flutter_getx_firebase_chat/app/modules/ChatListScreen/views/chat_list_screen_view.dart';
import 'package:tynenger_flutter_getx_firebase_chat/app/modules/SettingsScreen/views/settings_screen_view.dart';
import 'package:tynenger_flutter_getx_firebase_chat/app/modules/UserListScreen/views/user_list_screen_view.dart';

class HomeController extends GetxController {
  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  Color get navBarBackgroundColor =>
      Get.isDarkMode ? Colors.black : Colors.white;

  Rx<Color> navBarColor =
      (Get.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white).obs;

  Rx<Color> navBarMainColor =
      (Get.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white).obs;

  @override
  void onInit() {
    super.onInit();
    ever(Get.isDarkMode.obs, (_) => updateNavBarColor());
  }

  void updateNavBarColor() {
    navBarMainColor.value = Get.isDarkMode
        ? const Color(0xFF1E1E1E)
        : Colors.white;
  }

  List<Widget> buildScreens() {
    return [
      const ChatListScreenView(),
      const UserListScreenView(),
      SettingsScreenView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    final isDark = Get.isDarkMode;
    print("Building navBarsItems, isDarkMode: $isDark");
    Color activeColor = isDark ? Colors.deepPurple : Colors.deepPurple;
    Color inactiveColor = isDark ? Colors.blueGrey : Colors.blueGrey;

    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: ("Chats"),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.group),
        title: ("Users"),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Settings"),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inactiveColor,
      ),
    ];
  }

  void onItemSelected(int index) {
    persistentTabController.index = index;
  }
}
