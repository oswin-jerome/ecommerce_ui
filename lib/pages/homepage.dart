import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/components/categoryHolder.dart';
import 'package:ecommerce/components/customAppBar.dart';
import 'package:ecommerce/components/productHolder.dart';
import 'package:ecommerce/components/recomendedProducts.dart';
import 'package:ecommerce/components/sections/categoriesSection.dart';
import 'package:ecommerce/components/sections/latestProducts.dart';
import 'package:ecommerce/utils/mock.dart';
import 'package:ecommerce/utils/utils.dart';
import 'package:flutter/material.dart';
import "package:ecommerce/components/sections/slider.dart" as sl;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(80),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: green4,
      //   mini: false,
      //   child: Icon(
      //     Icons.ac_unit,
      //     size: 40,
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 60,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: bottomPainter(),
              ),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      Text("Home")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.category,
                        color: Colors.grey,
                      ),
                      Text("Categories")
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Text("User")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: Colors.grey,
                      ),
                      Text("Cart")
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              left: (MediaQuery.of(context).size.width / 2) - 30,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: green4,
                    boxShadow: [
                      BoxShadow(
                        color: green4,
                        blurRadius: 8,
                      )
                    ]),
                child: Icon(
                  Icons.ac_unit,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CategoriesSection(),
              sl.Slider(),
              LatestProducts(),
              RecomendedProducts()
            ],
          ),
        ),
      ),
    );
  }
}

class bottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = new Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - 30)
      ..quadraticBezierTo(
          size.width - 0, size.height - 60, size.width - 40, size.height - 60)
      ..lineTo((size.width / 2) + 40, 00)
      ..quadraticBezierTo((size.width / 2) + 30, -30, (size.width / 2), -30)
      ..quadraticBezierTo((size.width / 2) - 30, -30, (size.width / 2) - 40, 0)
      ..lineTo((size.width / 2) - 50, 00)
      ..lineTo(30, 00)
      ..quadraticBezierTo(size.height - 50, 0, 0, size.height - 40)
      ..close();
    // ..close();
    // canvas.drawShadow(path, Colors.grey.withAlpha(50), 4.0, true);
    canvas.drawShadow(path.shift(Offset(0, -3)), Colors.black, 8.0, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
