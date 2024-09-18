import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/view/widgets/category.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          'Browse Category',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            childAspectRatio: 2,
          ),
          itemCount: 12,
          itemBuilder: (_, int index) {
            return const Category();
          },
        ),
      ),
    ]);
  }
}
