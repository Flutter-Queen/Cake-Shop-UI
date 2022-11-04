// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BirthdayModel {
  final String flavor;
  final String price;
  final color;
  final String imagePath;
  BirthdayModel(
      {required this.flavor,
      required this.price,
      required this.imagePath,
      required this.color});

  static List<BirthdayModel> birthday = [
    BirthdayModel(
        flavor: 'Chocolate',
        price: '\$90',
        color: Colors.brown,
        imagePath: 'assets/birthdaycakes/birthdaycake5.png'),
    BirthdayModel(
        flavor: 'Strawberry',
        price: '\$80',
        color: Colors.red,
        imagePath: 'assets/birthdaycakes/birthdaycake1.png'),
    BirthdayModel(
        flavor: 'plain cake',
        price: '\$45',
        color: Colors.purple,
        imagePath: 'assets/birthdaycakes/birthdaycake4.png'),
    BirthdayModel(
        flavor: 'Black Forest',
        price: '\$100',
        color: Colors.green,
        imagePath: 'assets/birthdaycakes/birthdaycake2.png'),
    BirthdayModel(
        flavor: 'Raspberry',
        price: '\$65',
        color: Colors.orange,
        imagePath: 'assets/birthdaycakes/birthdaycake3.png')
  ];
}
