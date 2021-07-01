import 'package:account_app/bindings/add_person_binding.dart';
import 'package:account_app/pages/add_person_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddPersonPage(), binding: AddPersonBinding());
        },
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
