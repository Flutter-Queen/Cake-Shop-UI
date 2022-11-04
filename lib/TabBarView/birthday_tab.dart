import 'package:cake_shop_app/Models/bidthday_model.dart';
import 'package:flutter/material.dart';

import '../Screens/birthday_screen.dart';
import '../Utilities/Tiles/birthday_tile.dart';

class BirthdaysTab extends StatelessWidget {
  const BirthdaysTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BirthdayModel> birthdays = BirthdayModel.birthday;
    return BirthdayGrid(birthdays: birthdays);
  }
}

class BirthdayGrid extends StatelessWidget {
  const BirthdayGrid({
    Key? key,
    required this.birthdays,
  }) : super(key: key);

  final List<BirthdayModel> birthdays;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: birthdays.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          BirthdayModel birthdayModel = birthdays[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BirthdayCakeScreen(birthday: birthdayModel)));
            },
            child: BirthdayCakeTile(
                flavor: birthdayModel.flavor,
                imagePath: birthdayModel.imagePath,
                price: birthdayModel.price,
                colors: birthdayModel.color),
          );
        });
  }
}
