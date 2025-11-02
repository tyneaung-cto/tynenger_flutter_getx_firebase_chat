import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_list_screen_controller.dart';

class UserListScreenView extends GetView<UserListScreenController> {
  const UserListScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Make new friends'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Friends'),
              Tab(text: 'Search New Friends'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                final users = [
                  "John Doe",
                  "Jane Smith",
                  "Alex Brown",
                  "Emily Davis",
                ];
                final user = users[index];
                final isOnline = index % 2 == 0;
                return ListTile(
                  leading: CircleAvatar(child: Text(user[0])),
                  title: Text(user),
                  subtitle: Text(isOnline ? "Online" : "Offline"),
                  onTap: () {
                    Get.snackbar(
                      "Chat",
                      "Chat with $user",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                );
              },
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final newUsers = [
                        "Mark Lee",
                        "Sophie Turner",
                        "Chris Evans",
                        "Luna Lovegood",
                      ];
                      final user = newUsers[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(user[0])),
                        title: Text(user),
                        onTap: () {
                          Get.snackbar(
                            "Request",
                            "Send request to $user",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
