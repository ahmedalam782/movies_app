import 'package:flutter/material.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

class Item extends StatelessWidget {
  Item(this.isSaved, {super.key});
  bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 4),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Image.asset(
                        'assets/images/item_watch.png',
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      isSaved
                          ? const Icon(
                              Icons.bookmark,
                              size: 40,
                              color: AppTheme.primary,
                            )
                          : const Icon(
                              Icons.bookmark,
                              size: 40,
                              color: AppTheme.darkGray,
                            ),
                      isSaved
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.check,
                                size: 22,
                                color: AppTheme.white,
                              ))
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 22,
                                color: AppTheme.white,
                              ))
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alita Battle Angel',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '2019',
                      style: TextStyle(
                        color: AppTheme.gray,
                      ),
                    ),
                    Text(
                      'Rosa Salazar, Christoph Waltz',
                      style: TextStyle(
                        color: AppTheme.gray,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const Divider(
            color: AppTheme.gray,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
