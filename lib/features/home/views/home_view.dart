import 'package:flutter/material.dart';
import 'package:store_app/features/home/widgets/app_bar.dart';
import 'package:store_app/features/home/widgets/categories_list.dart';
import 'package:store_app/features/home/widgets/category_items.dart';
import 'package:store_app/features/home/widgets/search_field.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/data/services/all_products_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController _searchController;
  final AllProductsService _productsService = AllProductsService();

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  Future<List<ProductModel>> _fetchProducts() {
    return _productsService.getAllProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EFE6),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CustomScrollView(
          slivers: [
            // appBar
            CustomAppBar(),
            // search
            SearchField(searchController: _searchController),
            // categories
            CategoriesList(),
            // fetch data from api and show in list
            FutureBuilder<List<ProductModel>>(
              future: _fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (snapshot.hasData) {
                  final products = snapshot.data!;
                  return CategoryItems(products: products);
                } else {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('No products available.')),
                  );
                }
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
