import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String imgurl;
  final int price;
  final Function()? onTap;
  final Function()? onFavoriteTap;
  final bool isFavorite;
  const CustomCard({
    super.key,
    required this.title,
    required this.imgurl,
    required this.price,
    this.onTap,
    this.onFavoriteTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 15,
              right: 0,
              child: Text(
                '\$$price',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 15,
              right: 0,
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned.fill(
              bottom: 60,
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(imgurl, fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
