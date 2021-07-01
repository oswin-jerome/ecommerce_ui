import 'package:ecommerce/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductHolder extends StatefulWidget {
  String image;
  String description;
  double price;
  bool isBig;

  ProductHolder(
      {required this.image,
      required this.description,
      required this.price,
      required this.isBig});

  @override
  _ProductHolderState createState() => _ProductHolderState();
}

class _ProductHolderState extends State<ProductHolder> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: widget.isBig ? 5 : 3,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                widget.isBig
                    ? Expanded(
                        child: Align(
                        alignment: Alignment.centerLeft,
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 12,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ))
                    : Container(),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 3),
                    child: Container(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: widget.isBig ? 12 : 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 0),
                    child: Container(
                      child: Text(
                        "\$ ${widget.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.isBig ? 18 : 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // flex: 2,
                  height: 35,
                  child: Container(
                    color: green3,
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
              ),
            ),
            widget.isBig
                ? Positioned(
                    top: 10,
                    left: 5,
                    child:
                        Text("inhouse product", style: TextStyle(fontSize: 9)),
                  )
                : Positioned(
                    right: 0,
                    top: 40,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: green3,
                      child: Text(
                        "26 availabel",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
