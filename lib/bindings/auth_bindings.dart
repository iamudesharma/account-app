import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthBinding>(
      AuthBinding(),
    );
  }
}
