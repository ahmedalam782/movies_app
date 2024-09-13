import 'package:flutter/material.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Watchlist",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
