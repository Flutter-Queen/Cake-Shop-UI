import 'package:flutter/material.dart';

import '../Utilities/Tiles/weddingcake_tile.dart';

class WeddingCakeTab extends StatelessWidget {
  const WeddingCakeTab({super.key});

  @override
  Widget build(BuildContext context) {
    List weddingCakes = [
      // flavor, price, color, image
      [
        'Wedding',
        '\$290',
        Colors.brown,
        'assets/weddingcakes/wedding-cake1.png'
      ],
      [
        'Reception',
        '\$180',
        Colors.red,
        'assets/weddingcakes/wedding-cake2.png'
      ],
      [
        'Pre-Wedding',
        '\$245',
        Colors.purple,
        'assets/weddingcakes/wedding-cake3.png'
      ],
      [
        'Engagement',
        '\$100',
        Colors.green,
        'assets/weddingcakes/wedding-cake4.png'
      ],
      [
        'Anversary',
        '\$345',
        Colors.orange,
        'assets/weddingcakes/wedding-cake5.png'
      ]
    ];
    return GridView.builder(
        itemCount: weddingCakes.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return WeddingCakeTile(
            flavor: weddingCakes[index][0],
            price: weddingCakes[index][1],
            colors: weddingCakes[index][2],
            imagePath: weddingCakes[index][3],
          );
        });
  }
}
