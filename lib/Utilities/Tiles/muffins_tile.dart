import 'package:flutter/material.dart';

class MuffinTiles extends StatelessWidget {
  const MuffinTiles(
      {super.key,
      required this.flavor,
      required this.imagePath,
      required this.price,
      required this.colors});
  final String flavor;
  final String price;
  final String imagePath;
  final colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: colors[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          //Price
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors[100],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  price,
                  style: TextStyle(
                      color: colors[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),

          //Picture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12),
            child: Image.asset(imagePath),
          ),
          //Flavor
          Text(
            flavor,
            style: TextStyle(
                color: colors[800], fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Ganache',
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),

          //Love Icon and add button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.pink[400],
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[800],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
