import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_chat_screen_controller.dart';

class GroupChatScreenView extends GetView<GroupChatScreenController> {
  const GroupChatScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroupChatScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GroupChatScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
