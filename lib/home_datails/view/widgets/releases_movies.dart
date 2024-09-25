import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/data/models/upcoming_models/upcoming_movies.dart';
import 'package:movies_app_route/movies_details/view/screens/movie_details_new.dart';

import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/end_point.dart';

class ReleasesMovies extends StatelessWidget {
  const ReleasesMovies({super.key, required this.upcomingMovies});

  final UpcomingMovies upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: upcomingMovies,
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "${EndPoint.imageBaseUrl}${upcomingMovies.posterPath}",
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                  height: 150,
                  width: 100,
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: -14.5,
                start: -18.5,
                child: IconButton(
                    onPressed: () {},
                    icon: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.bookmark,
                          size: 50,
                          color: AppTheme.darkGray.withOpacity(.87),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppTheme.white,
                            size: 18,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
