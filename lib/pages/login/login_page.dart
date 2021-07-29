import 'package:account_app/controller/auth_controller/auth_controller.dart';
import 'package:account_app/helpers/helpers.dart';
import 'package:account_app/pages/registration/registration_page.dart';
import 'package:account_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // autovalidate: ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.loginformKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              const Spacer(),
              LoginFormWidget(
                validator: (email) {
                  return controller.emailValidator(email!);
                },
                controller: controller.emaillController,
                hinText: 'Enter The Email',
                isPassword: false,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                labelText: 'Email',
              ),
              const SizedBox(
                height: 20,
              ),
              LoginFormWidget(
                validator: (password) =>
                    controller.passwordValidator(password!),
                controller: controller.passwordController,
                hinText: 'Enter The Password',
                isPassword: true,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                labelText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (!controller.loginformKey.currentState!.validate()) {
                      return;
                    } else {
                      controller.loginUser('udesh@gmail.com', 'Udesh@123');
                      Get.toNamed(Routes.HOMEROUTES);
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              const Text('or'),
              SizedBox(
                width: context.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const RegistrationPage());
                  },
                  child: const Text('Crete an Account'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
