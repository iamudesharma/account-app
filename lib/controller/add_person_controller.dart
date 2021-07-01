import 'package:account_app/model/person_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPersonController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController desController;
  late TextEditingController totalpriceController;
  late TextEditingController phoneNumberController;
  late DateTime dateTime = DateTime.now();

  var person = <Person>[].obs;

  var isCompeteled = false.obs;
  var isgive = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    desController = TextEditingController();
    totalpriceController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  void addPerson(Person per) {
    person.value.add(per);
  }

  @override
  void onClose() {
    nameController.dispose();
    desController.dispose();
    totalpriceController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
