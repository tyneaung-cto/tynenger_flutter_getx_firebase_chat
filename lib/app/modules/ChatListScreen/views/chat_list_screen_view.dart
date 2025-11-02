import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/chat_list_screen_controller.dart';

class ChatListScreenView extends GetView<ChatListScreenController> {
  const ChatListScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;
    final textColor = isDark ? Colors.white : Colors.black;
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Row(
          children: [
            // Icon(Icons.chat_bubble_rounded, color: iconColor),
            const SizedBox(width: 8),
            Text(
              'Tynenger',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => Get.toNamed('/profile-screen'),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/icon/icon.png'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search or start a new chat',
                hintStyle: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark ? Colors.white70 : Colors.grey,
                ),
                filled: true,
                fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _chatTile(
                    'Tyne Aung',
                    'Hey, how are you?',
                    '1:30',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Emma',
                    'Help, how about t.',
                    '11:50',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'David',
                    'Typing j u later',
                    '10:10',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Olivia',
                    'See you u letik’d',
                    '10:15',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Michael',
                    'Varkent',
                    '09:50',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Tyne Aung',
                    'Hey, how are you?',
                    '1:30',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Emma',
                    'Help, how about t.',
                    '11:50',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'David',
                    'Typing j u later',
                    '10:10',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Olivia',
                    'See you u letik’d',
                    '10:15',
                    'assets/icon/icon.png',
                  ),
                  _chatTile(
                    'Michael',
                    'Varkent',
                    '09:50',
                    'assets/icon/icon.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Get.find<HomeController>().persistentTabController.jumpToTab(1);
      //   },
      //   backgroundColor: Colors.deepPurpleAccent,
      //   child: const Icon(Icons.add, color: Colors.white),
      // ),
    );
  }
}

Widget _chatTile(String name, String message, String time, String avatarPath) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
    leading: CircleAvatar(backgroundImage: AssetImage(avatarPath), radius: 24),
    title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(message, overflow: TextOverflow.ellipsis),
    trailing: Text(time, style: const TextStyle(color: Colors.grey)),
    onTap: () {
      Get.toNamed('/chat-screen');
    },
  );
}
