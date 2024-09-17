import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view/widgets/movie_details.dart';

import '../../../shared/components/movies_container.dart';
import '../../../shared/components/movies_image_components.dart';
import '../../../shared/themes/app_theme.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  List<Widget> movies = List.generate(
    10,
    (index) => MoviesImageComponents(
      isOpen: true,
      image: 'assets/images/movie_img_test3.png',
      backgroundBookmarkIcon: AppTheme.darkGray.withOpacity(.87),
      movieRate: '7.7',
      movieDate: "2019  PG-13  2h 7m",
      movieTitle: 'Deadpool 2',
    ),
  );
  List<Widget> movies1 = List.generate(
    10,
    (index) => MoviesImageComponents(
      image: 'assets/images/movie_img_test3.png',
      backgroundBookmarkIcon: AppTheme.darkGray.withOpacity(.87),
    ),
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                child: Image.asset(
                  "assets/images/movie_img_test4.png",
                  fit: BoxFit.cover,
                  height: height * .217,
                  width: double.infinity,
                ),
              ),
              const Icon(
                Icons.play_circle,
                color: AppTheme.white,
                size: 70,
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                bottom: -height * .08,
                start: width * .05,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetails.routeName);
                  },
                  child: MoviesImageComponents(
                    image: 'assets/images/movie_img_test.png',
                    backgroundBookmarkIcon: AppTheme.darkGray.withOpacity(.87),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: height * .13),
            child: Column(
              children: [
                Text(
                  "Dora and the lost city of gold",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  "2019  PG-13  2h 7m",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 10,
                        color: AppTheme.gray,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Expanded(
            child: ListView(
              children: [
                MoviesContainer(
                  categoryName: 'New Releases ',
                  height: 189,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      child: movies1[index],
                      onTap: () => Navigator.pushNamed(
                        context,
                        MovieDetails.routeName,
                      ),
                    ),
                    itemCount: movies1.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MoviesContainer(
                  categoryName: 'Recommended',
                  height: 259,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      child: movies[index],
                      onTap: () {
                        final movieComponent =
                            movies[index] as MoviesImageComponents;
                        Navigator.pushNamed(
                          context,
                          MovieDetails.routeName,
                          arguments: {'movieTitle': movieComponent.movieTitle},
                        );
                      },
                    ),
                    itemCount: movies.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
