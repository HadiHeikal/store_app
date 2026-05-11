import 'package:flutter/material.dart';
import 'package:store_app/features/home/widgets/custom_card.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class CategoryItems extends StatelessWidget {
  final List<ProductModel> products;

  const CategoryItems({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return CustomCard(
          isFavorite: false,
          title: product.title,
          imgurl: product.images,
          price: product.price,
          onTap: () {
            // TODO: navigate to product details view
          },
          onFavoriteTap: () {
            // TODO: handle favorite toggle
          },
        );
      },
    );
  }
}
