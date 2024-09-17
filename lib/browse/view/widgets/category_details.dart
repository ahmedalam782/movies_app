import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/view/widgets/item_in_category.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = '/category_details';
  const CategoryDetails(
    this.categoryId, {
    super.key,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, int index) {
          return const ItemInCategory();
        },
      ),
    );
  }
}
