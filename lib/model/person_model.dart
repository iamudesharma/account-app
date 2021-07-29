
import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String name;
  final int? phonenumber;
  final String? des;
  final bool? iscompelete;
  final bool isgive;
  final int price;
  final Timestamp timestamp;
  Person({
    required this.name,
    this.phonenumber,
    this.des,
    this.iscompelete,
    required this.isgive,
    required this.price,
    required this.timestamp,
  });
}
