import 'package:account_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/bindings.dart';
import 'controller/controller.dart';

class App extends GetView<AuthController> with GetLifeCycleBase {
   App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      initialRoute: Get.find<AuthController>().user.value != null
          ? Routes.HOMEROUTES
          : Routes.LONIGROUTES,
      getPages: routes,
      title: 'Person',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
