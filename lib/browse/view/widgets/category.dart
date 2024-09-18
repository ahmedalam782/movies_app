import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/view/widgets/category_details.dart';
import 'package:movies_app_route/home/view/screen/home_screen.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryDetails.routeName);
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
            'category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
