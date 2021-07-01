import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Slider extends StatelessWidget {
  const Slider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        buildSliderItem(
            "https://images.pexels.com/photos/4065159/pexels-photo-4065159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
        buildSliderItem(
            "https://images.pexels.com/photos/4040654/pexels-photo-4040654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
      ],
      options: CarouselOptions(
        height: 200,
        pageSnapping: false,
        disableCenter: true,
      ),
    );
  }

  AspectRatio buildSliderItem(String image) {
    return AspectRatio(
      aspectRatio: 4.7 / 3,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 0),
            // spreadRadius: ,
            blurRadius: 4,
          )
        ]),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
