import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/data/models/genres_movies.dart';

import '../../../movies_category_details/view/screens/category_details.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});

  final Genres category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CategoryDetails.routeName, arguments: category);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 160,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                'assets/images/category.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            category.name ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
