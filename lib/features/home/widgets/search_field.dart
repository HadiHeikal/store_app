import 'package:flutter/material.dart';
class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.searchController,});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 20,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            clipBehavior: Clip.antiAlias,
            child: TextField(
              controller: searchController,
              cursorHeight: 23,
              cursorWidth: 2,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, size: 30, color: Colors.black54),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                hintText: 'search products...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
