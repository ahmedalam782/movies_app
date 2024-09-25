import 'package:flutter/material.dart';
import 'package:movies_app_route/watchlist/view/widgets/item.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Watchlist',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, int index) {
                return Item(true);
              },
            ),
          ),
        ]);
  }
}
