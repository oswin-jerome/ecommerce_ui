import 'package:ecommerce/utils/mock.dart';
import 'package:flutter/material.dart';

import '../productHolder.dart';

class LatestProducts extends StatelessWidget {
  const LatestProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Products",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "more",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Text(
            "Recommended products",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (bc, i) {
                return AspectRatio(
                    aspectRatio: 1 / 1.2,
                    child: ProductHolder(
                      isBig: false,
                      description: products[i]['description'],
                      image: products[i]['image'],
                      price: double.parse(products[i]['price'].toString()),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
