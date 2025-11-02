import 'package:get/get.dart';

import '../controllers/chat_list_screen_controller.dart';

class ChatListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatListScreenController>(
      () => ChatListScreenController(),
    );
  }
}
