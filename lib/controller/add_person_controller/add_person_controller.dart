import 'package:account_app/model/person_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPersonController extends GetxController {
  late TextEditingController nameController,
      desController,
      totalpriceController,
      phoneNumberController;
  late DateTime dateTime = DateTime.now();
  GlobalKey<ScaffoldState> scafflodKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var givenMoney = 0.obs;
  var takeMoney = 0.obs;
  var person = <Person>[].obs;
  var isCompeteled = false.obs;
  var isgive = false.obs;
  var isloading = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    desController = TextEditingController();
    totalpriceController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  void clearTextfield() {
    nameController.clear();
    desController.clear();
    totalpriceController.clear();
    phoneNumberController.clear();
  }

  void giveortakeMoney() {
    // ignore: avoid_function_literals_in_foreach_calls, invalid_use_of_protected_member
    person.value.forEach((val) {
      if (val.isgive == true) {
        givenMoney += val.price;
      } else {
        takeMoney += val.price;
      }
    });
  }

  void addPerson(Person per) {
    // ignore: invalid_use_of_protected_member
    person.value.add(per);
    // ignore: invalid_use_of_protected_member
    if (person.value.isNotEmpty) {
      isloading.value = true;
      // print(is)
    } else {
      isloading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    desController.dispose();
    totalpriceController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  String? nameValidator(String value) {
    if (value.isEmpty) return 'This field is required';
    return null;
  }

  String? phoneValidator(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (value.isPhoneNumber) {
      return null;
    } else {
      return 'A valid phone number should be of 10 digits';
    }
  }

  String? priceValidator(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (value.isNum) {
      return null;
    } else {
      return 'This field is required';
    }
  }
}
