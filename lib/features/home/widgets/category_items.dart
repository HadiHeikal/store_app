import 'package:flutter/material.dart';
import 'package:store_app/features/home/widgets/custom_card.dart';

class CategoryItems extends StatefulWidget {
  final String title;
  final String imgurl;
  final int price;
  final int itemCount;
  const CategoryItems({
    super.key,
    required this.title,
    required this.imgurl,
    required this.price,
    required this.itemCount,
  });

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, item) {
        return CustomCard(
          isFavorite: isFavorite,
          title: widget.title,
          imgurl: widget.imgurl,
          price: widget.price,
          onTap: () {
            // TODO: navigate to product details view
          },
          onFavoriteTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        );
      },
    );
  }
}
