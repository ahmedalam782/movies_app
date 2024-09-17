import 'package:flutter/material.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

class CategoryType extends StatelessWidget {
  const CategoryType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppTheme.gray),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent),
      child: Align(
        alignment: Alignment.center,
        child: Text("Action",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppTheme.gray)),
      ),
    );
  }
}
