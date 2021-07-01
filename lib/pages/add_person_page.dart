import 'package:account_app/controller/add_person_controller.dart';
import 'package:account_app/helpers/helpers.dart';
import 'package:account_app/model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddPersonPage extends GetView<AddPersonController> {
  const AddPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Helpers.padding),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    'Add person'.text.xl3.blue500.make(),
                    const SizedBox(
                      height: 20,
                    ),
                    Helpers.textField(
                      controller: controller.nameController,
                      title: 'Name',
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Helpers.textField(
                      controller: controller.phoneNumberController,
                      title: 'Phone Number',
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Helpers.textField(
                      controller: controller.totalpriceController,
                      title: 'price',
                      textInputType: TextInputType.number,
                    ),
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
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        'Given'.text.blue400.make()
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.addPerson(Person(name: name, des: des, iscompelete: iscompelete, isgive: isgive))
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
        ));
  }
}
