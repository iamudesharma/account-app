import 'package:account_app/services/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthServices authServices;

  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerformKey = GlobalKey<FormState>();

  late TextEditingController emaillController, passwordController;

  final user = Rxn<User>();

  AuthController({required this.authServices});
  @override
  void onInit() {
    //  authServices.persistence();
    user.bindStream(
      authServices.auth.authStateChanges(),
    );
   
    emaillController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emaillController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<User?> createUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await authServices.createUser(email, password);
      user.value = userCredential.user;
    } catch (e) {
      // print(e.toString());
    }
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await authServices.loginUser(email, password);
      user.value = userCredential.user;
      return user.value;
    } catch (e) {
      rethrow;
    }
  }

  String? emailValidator(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    }
    if (email.isEmpty) {
      return "This field is required ";
    }
    if (!GetUtils.isEmail(email)) {
      return 'Enter The Correct Email';
    }
  }

  String? passwordValidator(String password) {
    if (password.isEmpty) {
      return 'This field is required';
    }
    if (password.length > 8) {
      return 'Enter at least 8 digit';
    }
  }
}
