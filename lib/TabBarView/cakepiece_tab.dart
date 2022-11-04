import 'package:flutter/material.dart';

import '../Utilities/Tiles/cakepiece_tile.dart';

class CakePiecesTab extends StatelessWidget {
  const CakePiecesTab({super.key});

  @override
  Widget build(BuildContext context) {
    List cakePieces = [
      // flavor, price, color, image
      ['Strawberry', '\$10', Colors.red, 'assets/cakepieces/cake-piece1.png'],
      ['Plain cake', '\$6', Colors.purple, 'assets/cakepieces/cake-piece2.png'],
      ['Chcolate', '\$18', Colors.brown, 'assets/cakepieces/cake-piece3.png'],
      [
        'Black Forest',
        '\$20',
        Colors.green,
        'assets/cakepieces/cake-piece4.png'
      ],
      ['Raspberry', '\$15', Colors.orange, 'assets/cakepieces/cake-piece5.png']
    ];
    return GridView.builder(
        itemCount: cakePieces.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return CakePieceTile(
            flavor: cakePieces[index][0],
            price: cakePieces[index][1],
            colors: cakePieces[index][2],
            imagePath: cakePieces[index][3],
          );
        });
  }
}
