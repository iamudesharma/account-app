import 'package:account_app/bindings/bindings.dart';
import 'package:account_app/helpers/helpers.dart';
import 'package:account_app/pages/add_person/add_person_page.dart';
import 'package:account_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NothingPage extends GetView {
  const NothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.to(
            () => AddPersonPage(),
            binding: AddPersonBinding(),
          ); // await Get.to(
          //   () => AddPersonPage(),
          //   preventDuplicates: true,
          // );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 100,
                  child: SvgPicture.asset(
                    Helpers.Person2Svg,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 300,
                  width: 100,
                  child: SvgPicture.asset(
                    Helpers.Person1Svg,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Add Some',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(
                      () => AddPersonPage(),
                      binding: AddPersonBinding(),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                const Text(
                  'persons',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
