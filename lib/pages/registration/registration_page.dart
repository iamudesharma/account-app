import 'package:account_app/controller/auth_controller/auth_controller.dart';
import 'package:account_app/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.registerformKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              const Spacer(),
              LoginFormWidget(
                validator: (email) => controller.emailValidator(email!),
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
                    if (!controller.registerformKey.currentState!.validate()) {
                      return;
                    } else {

                    }
                  },
                  child: const Text('Register'),
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
