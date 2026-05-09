import 'package:flutter/material.dart';
import 'package:store_app/features/favorites/views/favorites.dart';
import 'package:store_app/features/home/views/home_view.dart';
import 'package:store_app/features/product/views/product_details_view.dart';
import 'package:store_app/features/profile/view/profile_view.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  late List<Widget> pages;
  int _currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pages = [HomeView(), ProductDetailsView(), FavoritesView(), ProfileView()];
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blueGrey,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              currentIndex: _currentIndex,
              iconSize: 26,

              selectedFontSize: 12,
              unselectedFontSize: 12,
              showUnselectedLabels: true,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
