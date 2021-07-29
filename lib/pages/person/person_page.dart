// import 'package:account_app/controller/database_controller.dart';
import 'package:account_app/controller/database_controller/database_controller.dart';
import 'package:account_app/key.dart';
import 'package:account_app/pages/loading/loading_page.dart';
import 'package:account_app/pages/nothing.dart';
import 'package:account_app/widgets/person_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonPage extends GetView<DataBaseController> {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.dataBaseServices.firestore
            .collection('person')
            .doc(Keys.FirebaseUId)
            .collection('personsList')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LoadingPage();
          }
          if (snapshot.data!.docs.isEmpty) {
            return const NothingPage();
          }
          if (snapshot.connectionState == ConnectionState.done) {}
          final person = snapshot.data!.docs;
// void givenMenoy() {
          num given = 0;
          num take = 0;

          for (var element in person) {
            if (element["isgive"] == true) {
              given += element['price'];
              // print(given.toString() + "give");

              controller.givenMoeney.value = given;
              // controller.givenMoeney.value = given;
            } else {
              take += element['price'];
              // print(take.toString() + 'take');
              controller.takeMeeny.value = take;
              // controller.takeMeeny.value = take;
            }
          }

// }

          return snapshot.data == null
              ? const NothingPage()
              : PersonList(
                  person: person,
                );
        });
  }
}

