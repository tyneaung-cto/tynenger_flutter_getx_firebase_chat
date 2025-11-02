import 'package:get/get.dart';

class AuthGateController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    // _auth.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     Get.offAllNamed('/login-screen');
    //   } else {
    //     Get.offAllNamed('/home');
    //   }
    // });
  }
}
