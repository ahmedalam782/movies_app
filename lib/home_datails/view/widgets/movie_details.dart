import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view/widgets/category_type.dart';
import 'package:movies_app_route/home_datails/view/widgets/custom_chip.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/d.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/play.png",
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dora And The Lost City",
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text("2019  PG-13  2h 37m",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppTheme.gray)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 10),
                          child: Image.asset(
                            "assets/images/d.jpg",
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: MediaQuery.of(context).size.width * 0.38,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: AppTheme.darkGray,
                              size: 50,
                            ),
                            Icon(
                              Icons.add,
                              color: AppTheme.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),

                    // Right side
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   height: 40,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: 5,
                            //     itemBuilder: (context, index) {
                            //       return CategoryType();
                            //     },
                            //   ),
                            // ),
                            CustomChipBuilderWidget(),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Text(
                              'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppTheme.primary,
                                  size: 26,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '7.7',
                                  style: TextStyle(
                                      color: AppTheme.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
