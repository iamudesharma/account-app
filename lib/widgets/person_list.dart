// import 'package:account_app/controller/database_controller.dart';
import 'package:account_app/bindings/bindings.dart';
import 'package:account_app/controller/database_controller/database_controller.dart';
import 'package:account_app/pages/add_person/add_person_page.dart';
import 'package:account_app/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonList extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> person;
  PersonList({
    Key? key,
    required this.person,
  }) : super(key: key);

  final controller = Get.find<DataBaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              sliver: SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                // toolbarHeight: 100,
                expandedHeight: 220,
                flexibleSpace: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Center(
                        child: Obx(
                          () => Text(
                            controller.givenMoeney.value.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      width: context.width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 200,
                    ),
                    Container(
                      child: Center(
                        child: Obx(
                          () => Text(
                            '${controller.takeMeeny.value}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: context.width * 0.45,
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child:
            // ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      onTap: () {
                        controller.detelePerson(person[index].id).then(
                              (value) => print(
                                  'This person removed +${person[index]["name"]}'),
                            );
                      },
                      title: Text(
                        person.elementAt(index)['name'],
                      ),
                    );
                  },
                  childCount: person.length,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
          // controller.);
          Get.to(
            () => AddPersonPage(),
            binding: AddPersonBinding(),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
