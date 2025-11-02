import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.titleLarge?.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Login to continue chatting',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
              const SizedBox(height: 32),
              GFTextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                keyboardType: TextInputType.emailAddress,
                borderradius: Radius.circular(12),
                color: theme.inputDecorationTheme.fillColor,
                style: GoogleFonts.poppins(color: theme.textTheme.bodyLarge?.color),
              ),
              const SizedBox(height: 16),
              GFTextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                obscureText: true,
                borderradius: Radius.circular(12),
                color: theme.inputDecorationTheme.fillColor,
                style: GoogleFonts.poppins(color: theme.textTheme.bodyLarge?.color),
              ),
              const SizedBox(height: 32),
              GFButton(
                onPressed: () {
                  controller.loginUser();
                },
                text: 'Login',
                size: GFSize.LARGE,
                fullWidthButton: true,
                color: theme.primaryColor,
                textStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onPrimary,
                ),
                shape: GFButtonShape.pills,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/register-screen');
                },
                child: Text(
                  "Don't have an account? Register",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.secondary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
