import 'package:flutter/material.dart';
import 'package:store_app/features/home/widgets/app_bar.dart';
import 'package:store_app/features/home/widgets/categories_list.dart';
import 'package:store_app/features/home/widgets/category_items.dart';
import 'package:store_app/features/home/widgets/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
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
            // products grid view
            CategoryItems(
              title: 'Product',
              imgurl:
                  'https://imgs.search.brave.com/AhjurbK6WHJbHHyrGu-B6ycb-3P3vlI9hFHqhatV1FA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMjIy/MzgwNDg2My9waG90/by9tb250cmVhbC1j/YW5hZGEtbGlvbmVs/LW1lc3NpLW9mLWlu/dGVyLW1pYW1pLWNm/LWxvb2tzLW9uLXBy/aW9yLXRvLXRoZS1t/bHMtbWF0Y2gtYmV0/d2Vlbi1jZi5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9U2dV/bEpIWHhSb2hyMkFK/eGZWVXNXTVFacFNF/aXdkSHA0bDk2NzFL/ZE5IRT0',
              price: 100,
              itemCount: 10,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
