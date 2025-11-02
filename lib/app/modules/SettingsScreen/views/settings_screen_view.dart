import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tynenger_flutter_getx_firebase_chat/app/modules/SettingsScreen/controllers/settings_screen_controller.dart';

class SettingsScreenView extends GetView<SettingsScreenController> {
  SettingsScreenView({super.key});

  final SettingsScreenController controller = Get.put(
    SettingsScreenController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        children: [
          // Account Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Edit Profile page
              Get.toNamed('/profile-screen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            // trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle logout
              controller.logout();
            },
          ),
          const Divider(),

          // Preferences Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Preferences',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Obx(
            () => SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: controller.isDarkMode.value,
              onChanged: (bool value) {
                // controller.isDarkMode.value = value;
                print(value);
                controller.toggleDarkMode(value);
                // Optionally handle theme change here
              },
            ),
          ),
          Obx(
            () => SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              value: controller.isNotificationsEnabled.value,
              onChanged: (bool value) {
                controller.isNotificationsEnabled.value = value;
                // Optionally handle notifications toggle here
              },
            ),
          ),
          const Divider(),

          // App Info Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'App Info',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Version'),
            trailing: Text('1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('About Tynenger'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to About page
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Policy page
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Request Account Delete'),
            onTap: () {
              // Handle account delete request
            },
          ),
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text('More Apps'),
            onTap: () {
              // Handle more apps action
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Support / Feedback'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Support / Feedback page
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

extension on TextTheme {
  TextStyle? get headline6 => null;
}
