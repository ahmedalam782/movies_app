import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "HomeDetails",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
