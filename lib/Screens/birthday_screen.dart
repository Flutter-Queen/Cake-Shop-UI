import 'package:cake_shop_app/Models/bidthday_model.dart';
import 'package:flutter/material.dart';

class BirthdayCakeScreen extends StatelessWidget {
  const BirthdayCakeScreen({super.key, required this.birthday});
  final BirthdayModel birthday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.purple,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.transparent,
              expandedHeight: 180,
              floating: true,
              snap: true,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: ClipPath(
                      clipper: _CustomClipper(),
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: birthday.color[50],
                          ),
                          child: Image.asset(birthday.imagePath)),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: Text(
                  "${birthday.flavor} Cake 🎂",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ingredients(
                    borderColor: Colors.orange.shade500,
                    color: Colors.orange.withOpacity(0.6),
                    percentColor: Colors.orange[300],
                    text: 'Sugar',
                    gram: '8 Gram',
                    percent: '2%',
                  ),
                  Ingredients(
                    borderColor: Colors.green.shade500,
                    color: Colors.green.withOpacity(0.6),
                    percentColor: Colors.green[300],
                    text: 'Salt',
                    gram: '8 Gram',
                    percent: '3%',
                  ),
                  Ingredients(
                    borderColor: Colors.red.shade500,
                    color: Colors.red.withOpacity(0.6),
                    percentColor: Colors.red[300],
                    text: 'Fat',
                    gram: '8 Gram',
                    percent: '12%',
                  ),
                  Ingredients(
                    borderColor: Colors.blue.shade500,
                    color: Colors.blue.withOpacity(0.6),
                    percentColor: Colors.blue[300],
                    text: 'Energy',
                    gram: '8 Gram',
                    percent: '40%',
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Details",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    letterSpacing: 2),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "These basic ingredients for baking a cake are; flour, eggs, fat (usually butter), sugar, salt, a form of liquid (usually milk), and leavening agents (such as baking soda).",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87, fontSize: 17, wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              birthday.price,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Delivery not included",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  const Ingredients(
      {Key? key,
      required this.color,
      required this.gram,
      required this.percent,
      required this.text,
      required this.borderColor,
      required this.percentColor})
      : super(key: key);
  final color;
  final String text;
  final String gram;
  final String percent;
  final borderColor;
  final percentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: color,
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
        Text(
          gram,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 60,
          decoration:
              BoxDecoration(color: percentColor, shape: BoxShape.circle),
          child: Center(
            child: Text(
              percent,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 22),
            ),
          ),
        )
      ]),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path(); //* Path object

    //? Creating a line from container upper left corner to thw bottom left corner
    path.lineTo(
      0,
      size.height * 0.7,
    );

    //?Bezier curver method to create a curve that goes from the current point in the bottom left corner to another point and this use a control point that define what the curve look like
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.85,
      size.width * 0.3,
      size.height * 0.85,
    );

    //? this line goes from the end or first curve to the other side screen. A hroizontal line.
    path.lineTo(
      size.width * 0.7,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.85,
      size.width * 1,
      size.height * 1,
    );
//? Vertical line
    path.lineTo(
      size.width,
      0,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
