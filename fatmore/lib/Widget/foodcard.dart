import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'count.dart';

class FoodCard extends StatefulWidget {
  final String foodImage;
  final String foodName;
  final int price;
  final String mainIncrediants;
  final String description;
  final String calories;
  final VoidCallback onTap;
  final String foodId;

  const FoodCard({
    Key? key,
    required this.foodImage,
    required this.foodName,
    required this.price,
    required this.mainIncrediants,
    required this.description,
    required this.calories,
    required this.onTap,
    required this.foodId,
  }) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        height: 320,
        width: 250,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 300,
                width: 245,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: Colors.deepOrangeAccent.withOpacity(0.11)),
              ),
            ),
            Positioned(
              left: 3,
              top: 3,
              child: Container(
                height: 161,
                width: 161,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrangeAccent.withOpacity(0.19)),
              ),
            ),
            Positioned(
              top: 0,
              left: -50,
              child: Container(
                height: 155,
                width: 255,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(widget.foodImage))),
              ),
            ),
            Positioned(
              right: 30,
              top: 80,
              child: Text(
                "\$${widget.price}",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Poppins_Bold"),
              ),
            ),
            Positioned(
                top: 170,
                left: 20,
                child: Container(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.foodName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Poppins_Bold"),
                      ),
                      Text(
                        "With ${widget.mainIncrediants}",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                            fontFamily: "Poppins_Bold"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${widget.description}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.65),
                            fontSize: 9,
                            fontFamily: "Poppins_Bold"),
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.calories,
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.66),
                                fontSize: 12,
                                fontFamily: "Poppins_Bold"),
                          ),
                          SizedBox(
                            width: 95,
                          ),
                          Count(
                            foodName: widget.foodName,
                            // foodQuantity: '1',
                            foodId: widget.foodId,
                            price: widget.price,
                            foodImage:
                                widget.foodImage, //foodQuantity: widget.,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
