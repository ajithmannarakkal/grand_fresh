import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quantity_input/quantity_input.dart';

class ProductItem extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  ProductItem({required this.name, required this.price, required this.image});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int simpleIntInput = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.image,
              fit: BoxFit.fitWidth,
            ),
            Text(
              widget.name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                '₹ ${widget.price}',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                  ),
                ),
                Flexible(
                  child: Text(
                    "(5.00)1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: QuantityInput(
                      value: simpleIntInput,
                      onChanged: (value) => setState(() => simpleIntInput =
                          int.parse(value.replaceAll(',', '')))),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                        backgroundColor: Colors.white,
                        shape: StadiumBorder()),
                    onPressed: () {},
                    child: Text(
                      "ADD",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
