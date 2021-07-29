import 'package:account_app/model/person_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  late final FirebaseFirestore firestore;

  DataBaseServices({
    required this.firestore,
  });

  Future<void> addPersonData({
    required Person person,
    required String uid,
  }) async {
    await firestore
      ..collection('person')
          .doc('2uWJGUnlxeRWEL4xNlSsYNjjI1q1')
          .collection('personsList')
          .add({
        "name": person.name,
        "iscompelete": person.iscompelete,
        "isgive": person.isgive,
        "phonenumber": person.phonenumber,
        "price": person.price,
        "timestamp": person.timestamp,
      });
  }

  detelePerson(String path) async {
    await firestore
        .collection('person')
        .doc('2uWJGUnlxeRWEL4xNlSsYNjjI1q1')
        .collection('personsList')
        .doc(path)
        .delete();
  }

  Future<void> updateperson(String path, Person newPerson) async {
    await firestore.collection('person').doc(path).update({
      "name": newPerson.name,
      "iscompelete": newPerson.iscompelete,
      "isgive": newPerson.isgive,
      "phonenumber": newPerson.phonenumber,
      "price": newPerson.price,
    });
  }
}
