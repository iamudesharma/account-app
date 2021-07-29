import 'package:account_app/controller/add_person_controller/add_person_controller.dart';
import 'package:account_app/controller/database_controller/database_controller.dart';
import 'package:account_app/helpers/helpers.dart';
import 'package:account_app/model/person_model.dart';
import 'package:account_app/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddPersonPage extends GetView<AddPersonController> {
  AddPersonPage({Key? key}) : super(key: key);

  final dataBasecontroller = Get.find<DataBaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scafflodKey,
        // appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Helpers.padding),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Add Person'.text.xl4.blue500.make(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: SvgPicture.asset(
                          Helpers.ManSvg,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Helpers.textField(
                        controller: controller.nameController,
                        title: 'Name',
                        textInputType: TextInputType.name,
                        validator: (value) {
                          return controller.nameValidator(value!);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Helpers.textField(
                          controller: controller.phoneNumberController,
                          title: 'Phone Number',
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            return controller.phoneValidator(value!);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Helpers.textField(
                          controller: controller.totalpriceController,
                          title: 'price',
                          textInputType: TextInputType.number,
                          validator: (value) {
                            return controller.priceValidator(value!);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Helpers.textField(
                        controller: controller.desController,
                        title: 'des',
                        textInputType: TextInputType.multiline,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Checkbox(
                                value: controller.isgive.value,
                                onChanged: (value) {
                                  controller.isgive.value = value!;
                                },
                              )),
                          'Given'.text.blue400.make()
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (!controller.formKey.currentState!
                                    .validate()) {
                                  return;
                                } else {
                                  DateTime currentPhoneDate = DateTime.now();
                                  final person = Person(
                                    phonenumber: int.parse(
                                        controller.phoneNumberController.text),
                                    name: controller.nameController.text,
                                    des: controller.desController.text,
                                    iscompelete: false,
                                    isgive: controller.isgive.value,
                                    price: int.parse(controller
                                        .totalpriceController.text
                                        .trim()),
                                    timestamp:
                                        Timestamp.fromDate(currentPhoneDate),
                                  );

                                  dataBasecontroller.addData(person);

                                  Get.offAllNamed(
                                    Routes.PERSONROUTES,
                                  );
                                  controller.clearTextfield();
                                }
                              },
                              icon: const Icon(Icons.save),
                              label: const Text('Save'),
                            ),
                          ),

                        
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
