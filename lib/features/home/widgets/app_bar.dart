import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xFFF5EFE6),

      title: Text('Shopify'),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: Icon(
            Icons.shopping_basket_rounded,
            size: 28,
            color: Color(0xFF111111),
          ),
        ),
      ],
    );
  }
}
