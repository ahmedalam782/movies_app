import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({
    super.key,
    required this.categoryName,
    required this.child,
    required this.height,
  });

  final String categoryName;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .06,
        vertical: screenHeight * .02,
      ),
      decoration: BoxDecoration(
        color: AppTheme.white.withOpacity(.14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
            child: Text(
              categoryName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
           SizedBox(
            height: screenHeight*0.02,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
