import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';

import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/end_point.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({super.key, required this.topRatedMovies});

  final TopRatedMovies topRatedMovies;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
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
                imageUrl:
                    "${EndPoint.imageBaseUrl}${topRatedMovies.posterPath}",
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
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 95,
          padding: EdgeInsets.symmetric(
            horizontal: width * .02,
            vertical: height * .01,
          ),
          decoration: BoxDecoration(
            color: AppTheme.white.withOpacity(.16),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppTheme.primary,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    topRatedMovies.voteAverage?.toStringAsFixed(2)??
                        "",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 10,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                topRatedMovies.title ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 10,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                topRatedMovies.releaseDate ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 8, color: AppTheme.gray),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
