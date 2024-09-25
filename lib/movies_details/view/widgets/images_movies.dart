import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/data/models/upcoming_models/upcoming_movies.dart';
import 'package:movies_app_route/movies_details/view/screens/movie_details_new.dart';

import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/end_point.dart';

class ImagesMovies extends StatelessWidget {
  const ImagesMovies({super.key, required this.movies});

  final dynamic movies;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                imageUrl: "${EndPoint.imageBaseUrl}${movies.posterPath}",
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.image_not_supported,
                  color: AppTheme.white,
                ),
                height: 260,
                width: 160,
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              top: -5,
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
    );
  }
}
