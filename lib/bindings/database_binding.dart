// import 'package:account_app/controller/database_controller.dart';
import 'package:account_app/controller/database_controller/database_controller.dart';
import 'package:account_app/services/database/data_base_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataBaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DataBaseController>(DataBaseController(
      DataBaseServices(firestore: FirebaseFirestore.instance),
    ));
  }
}
