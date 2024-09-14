import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
