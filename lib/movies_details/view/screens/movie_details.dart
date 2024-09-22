import 'package:flutter/material.dart';
import 'package:movies_app_route/shared/components/custom_chip_categoryType.dart';
import 'package:movies_app_route/shared/components/movies_container.dart';
import 'package:movies_app_route/shared/components/movies_image_components.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  static const String routeName = '/movie_details';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<Widget> movies = List.generate(
    10,
    (index) => MoviesImageComponents(
      isOpen: true,
      image: 'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      backgroundBookmarkIcon: AppTheme.darkGray.withOpacity(.87),
      movieRate: '7.7',
      movieDate: "2019  PG-13  2h 7m",
      movieTitle: 'Deadpool 2',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final movieTitle = args?['movieTitle'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
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
              height: MediaQuery.of(context).size.height * 0.01,
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
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
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
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomChipBuilderWidget(),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                maxLines: 4,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
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
                ],
              ),
            ),
            MoviesContainer(
              categoryName: 'More Like This',
              height: 285,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
                itemBuilder: (_, index) => movies[index],
                itemCount: movies.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
