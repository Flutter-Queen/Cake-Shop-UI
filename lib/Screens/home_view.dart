import 'package:cake_shop_app/Utilities/cake_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../TabBarView/birthday_tab.dart';
import '../TabBarView/cakepiece_tab.dart';
import '../TabBarView/cupcake_tab.dart';
import '../TabBarView/muffin_tab.dart';
import '../TabBarView/wedding_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> cakeTabs = [
      CakeTabs(
          iconPath: 'assets/icons/birthday-cakeicon.png',
          colors: Colors.pink.shade50),
      CakeTabs(
          iconPath: 'assets/icons/cupcakeicon.png',
          colors: Colors.teal.shade50),
      CakeTabs(
          iconPath: 'assets/icons/piece-of-cakeicon.png',
          colors: Colors.brown.shade50),
      CakeTabs(
          iconPath: 'assets/icons/muffinicon.png',
          colors: Colors.yellow.shade50),
      CakeTabs(
          iconPath: 'assets/icons/weddingcakeicon.png',
          colors: Colors.red.shade50)
    ];
    return DefaultTabController(
      length: cakeTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[50],
          title: const Text(
            'Cake Shop 🎂',
            style: TextStyle(color: Colors.purple),
          ),
          elevation: 0.0,
          leading: const Icon(
            Icons.menu,
            color: Colors.purple,
            size: 30,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.green,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
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
                            color: Colors.purple[50],
                          ),
                          child: ImageSlideshow(
                            /// Width of the [ImageSlideshow].
                            width: double.infinity,

                            /// The page to show when first creating the [ImageSlideshow].
                            initialPage: 0,
                            indicatorColor: Colors.purple,

                            /// Called whenever the page in the center of the viewport changes.
                            onPageChanged: (value) {
                              print('Page changed: $value');
                            },

                            /// Auto scroll interval.
                            /// Do not auto scroll with null or 0.
                            autoPlayInterval: 3000,

                            /// Loops back to first slide.
                            isLoop: true,

                            /// The widgets to display in the [ImageSlideshow].
                            /// Add the sample image file into the images folder
                            children: [
                              Image.asset(
                                'assets/weddingcakes/wedding-cake2.png',
                              ),
                              Image.asset(
                                'assets/birthdaycakes/birthdaycake3.png',
                              ),
                              Image.asset(
                                'assets/cakepieces/cake-piece3.png',
                              ),
                              Image.asset(
                                'assets/cupcakes/cupcake5.png',
                              ),
                              Image.asset(
                                'assets/muffins/muffin5.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              //**********CHOOSE YOUR FAVS*********//
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10),
                child: Text(
                  'Choose Your Favourites',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              //**********CATEGORY TABS**********//
              TabBar(tabs: cakeTabs)
              //**********TAB BAR VIEW**********//
              ,
              const Expanded(
                child: TabBarView(
                  children: [
                    // Birthday cakes
                    BirthdaysTab(),
                    // Cupcakes
                    CupCakesTab(),
                    // cake pieces
                    CakePiecesTab(),
                    // muffins
                    MuffinsTab(),
                    // Wedding cake
                    WeddingCakeTab()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
