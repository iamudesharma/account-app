import 'package:account_app/app.dart';
import 'package:account_app/controller/add_person_controller/add_person_controller.dart';
import 'package:account_app/services/auth/auth_services.dart';
import 'package:account_app/services/database/data_base_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthController>(
    AuthController(
      authServices: AuthServices(auth: FirebaseAuth.instance),
    ),
  );
  print(Get.find<AuthController>().authServices.auth.currentUser!.uid +
      '            ----------------------------------');

  Get.put<DataBaseController>(
    DataBaseController(
      DataBaseServices(firestore: FirebaseFirestore.instance),
    ),
  );
  Get.put(() => AddPersonController());

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(App());
}
