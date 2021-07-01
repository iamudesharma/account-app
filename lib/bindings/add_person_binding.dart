import 'package:account_app/controller/add_person_controller.dart';
import 'package:get/get.dart';

class AddPersonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPersonController>(() => AddPersonController());
  }
}
