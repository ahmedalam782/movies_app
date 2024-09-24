import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_details/view/screens/movie_details_new.dart';
import 'package:movies_app_route/shared/network/remote/end_point.dart';

import '../../../shared/components/loading_indicator.dart';
import '../../../shared/components/movies_image_components.dart';
import '../../../shared/themes/app_theme.dart';
import '../../data/models/popular_models/popular_movies.dart';
import '../../../movies_details/view/screens/movie_details.dart';

class MoviesSliderItems extends StatelessWidget {
  const MoviesSliderItems({super.key, required this.popularMovies});

  final PopularMovies popularMovies;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: popularMovies,
        );
      },
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
                child: CachedNetworkImage(
                  imageUrl:
                      "${EndPoint.imageBaseUrl}${popularMovies.backdropPath}",
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                  height: height * .29,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Icon(
                Icons.play_circle,
                color: AppTheme.white,
                size: 70,
              ),
              Positioned.directional(
                bottom: -60,
                start: 16,
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetailsNew.routeName);
                  },
                  child: MoviesImageComponents(
                    image:
                        "${EndPoint.imageBaseUrl}${popularMovies.posterPath}",
                    backgroundBookmarkIcon: AppTheme.darkGray.withOpacity(.87),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: width * .31),
            child: Column(
              children: [
                Text(
                  popularMovies.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                      ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  popularMovies.releaseDate ?? "",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 10,
                        color: AppTheme.gray,
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
