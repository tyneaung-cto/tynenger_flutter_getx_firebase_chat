import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  //TODO: Implement ProfileScreenController

  final RxString userName = 'Tyne Aung'.obs;
  final RxString userEmail = 'tyne@example.com'.obs;
  final RxString profileImageUrl = ''.obs;
  final RxBool notificationsEnabled = false.obs;
  final RxBool darkModeEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }

  void toggleDarkMode(bool value) {
    darkModeEnabled.value = value;
  }

  void logout() {
    // Implement logout logic (e.g., clear user data, navigate to login screen)
  }
}
