import 'package:flutter/material.dart';

class ItemInCategory extends StatelessWidget {
  const ItemInCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Image.asset(
              'assets/images/item_watch.png',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'title in category selected !',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
