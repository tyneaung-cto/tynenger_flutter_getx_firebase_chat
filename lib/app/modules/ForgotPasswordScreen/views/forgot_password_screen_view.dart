import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_screen_controller.dart';

class ForgotPasswordScreenView extends GetView<ForgotPasswordScreenController> {
  const ForgotPasswordScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotPasswordScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotPasswordScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
