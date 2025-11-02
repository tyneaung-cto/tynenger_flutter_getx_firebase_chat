import 'package:get/get.dart';

import '../controllers/user_list_screen_controller.dart';

class UserListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListScreenController>(
      () => UserListScreenController(),
    );
  }
}
