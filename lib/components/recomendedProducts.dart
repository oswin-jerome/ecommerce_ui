import 'package:ecommerce/components/productHolder.dart';
import 'package:ecommerce/utils/mock.dart';
import 'package:flutter/material.dart';

class RecomendedProducts extends StatelessWidget {
  const RecomendedProducts({Key? key}) : super(key: key);

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
                "Recomended for you",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3 / 3.7),
            itemCount: products.length,
            shrinkWrap: true,
            itemBuilder: (bc, i) {
              return Container(
                  child: ProductHolder(
                description: products[i]['description'],
                image: products[i]['image'],
                isBig: true,
                price: double.parse(products[i]['price'].toString()),
              ));
            },
          )
        ],
      ),
    );
  }
}
