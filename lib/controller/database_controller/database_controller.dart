import 'package:account_app/key.dart';
import 'package:account_app/model/person_model.dart';
import 'package:account_app/services/database/data_base_services.dart';
import 'package:get/get.dart';

class DataBaseController extends GetxController {
  // String uid = Get.find<AuthController>().user.value!.uid;
  final DataBaseServices dataBaseServices;

  Rx<num> givenMoeney = 0.obs;
  Rx<num> takeMeeny = 0.obs;

  DataBaseController(this.dataBaseServices);

  Future<void> addData(
    Person person,
  ) async {
    try {
      await dataBaseServices.addPersonData(
        person: person,
        uid: Keys.FirebaseUId,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> detelePerson(String path) async {
    try {
      await dataBaseServices.detelePerson(path);
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
