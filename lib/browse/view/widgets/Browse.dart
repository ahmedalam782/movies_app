import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Browse",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
