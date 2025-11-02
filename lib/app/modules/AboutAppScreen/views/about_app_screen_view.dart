import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_app_screen_controller.dart';

class AboutAppScreenView extends GetView<AboutAppScreenController> {
  const AboutAppScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutAppScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AboutAppScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
