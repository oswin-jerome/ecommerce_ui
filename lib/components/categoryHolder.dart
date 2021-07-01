import 'package:flutter/material.dart';

class CategoryHolder extends StatelessWidget {
  final String name;
  final String image;
  CategoryHolder({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
          )
        ],
      ),
    );
  }
}
