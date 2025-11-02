import 'package:get/get.dart';

import '../modules/AboutAppScreen/bindings/about_app_screen_binding.dart';
import '../modules/AboutAppScreen/views/about_app_screen_view.dart';
import '../modules/AuthGate/bindings/auth_gate_binding.dart';
import '../modules/AuthGate/views/auth_gate_view.dart';
import '../modules/ChatListScreen/bindings/chat_list_screen_binding.dart';
import '../modules/ChatListScreen/views/chat_list_screen_view.dart';
import '../modules/ChatScreen/bindings/chat_screen_binding.dart';
import '../modules/ChatScreen/views/chat_screen_view.dart';
import '../modules/ForgotPasswordScreen/bindings/forgot_password_screen_binding.dart';
import '../modules/ForgotPasswordScreen/views/forgot_password_screen_view.dart';
import '../modules/GroupChatScreen/bindings/group_chat_screen_binding.dart';
import '../modules/GroupChatScreen/views/group_chat_screen_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/OnboardingScreen/bindings/onboarding_screen_binding.dart';
import '../modules/OnboardingScreen/views/onboarding_screen_view.dart';
import '../modules/ProfileScreen/bindings/profile_screen_binding.dart';
import '../modules/ProfileScreen/views/profile_screen_view.dart';
import '../modules/RegisterScreen/bindings/register_screen_binding.dart';
import '../modules/RegisterScreen/views/register_screen_view.dart';
import '../modules/SettingsScreen/bindings/settings_screen_binding.dart';
import '../modules/SettingsScreen/views/settings_screen_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/UserListScreen/bindings/user_list_screen_binding.dart';
import '../modules/UserListScreen/views/user_list_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  // static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => const RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_LIST_SCREEN,
      page: () => const ChatListScreenView(),
      binding: ChatListScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SCREEN,
      page: () => const ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.USER_LIST_SCREEN,
      page: () => const UserListScreenView(),
      binding: UserListScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_SCREEN,
      page: () => SettingsScreenView(),
      binding: SettingsScreenBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_APP_SCREEN,
      page: () => const AboutAppScreenView(),
      binding: AboutAppScreenBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_CHAT_SCREEN,
      page: () => const GroupChatScreenView(),
      binding: GroupChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SCREEN,
      page: () => const ForgotPasswordScreenView(),
      binding: ForgotPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_GATE,
      page: () => const AuthGateView(),
      binding: AuthGateBinding(),
    ),
  ];
}
