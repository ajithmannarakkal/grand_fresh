import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // final Image image;
  // final String title;
  // final VoidCallback onPressed;
  // CategoryItem({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/1646115445.jpeg",
              fit: BoxFit.fitWidth,
            ),
            Text("0.0 (0)"),
          ],
        ),
      ),
    );
  }
}
