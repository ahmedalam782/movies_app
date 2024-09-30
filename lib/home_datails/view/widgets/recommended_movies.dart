import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';
import 'package:provider/provider.dart';

import '../../../movies_details/view/screens/movie_details_new.dart';
import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';
import '../../../watchlist/data/models/movies_watchlist.dart';
import '../../view_model/movies_view_model.dart';

class RecommendedMovies extends StatefulWidget {
  const RecommendedMovies({super.key, required this.topRatedMovies});

  final TopRatedMovies topRatedMovies;

  @override
  State<RecommendedMovies> createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  @override
  Widget build(BuildContext context) {
    MoviesViewModel moviesViewModel = Provider.of<MoviesViewModel>(context);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: widget.topRatedMovies,
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
                      "${EndPoint.imageBaseUrl}${widget.topRatedMovies.posterPath}",
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) => const Icon(
                    Icons.image_not_supported,
                    color: AppTheme.white,
                  ),
                  height: 150,
                  width: 100,
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: -14.5,
                start: -18.5,
                child: IconButton(
                  onPressed: () {
                    if (widget.topRatedMovies.isWatchList == false) {
                      widget.topRatedMovies.isWatchList = true;
                      setState(() {});
                      moviesViewModel.addMovies(
                        MoviesWatchlist(
                          id: widget.topRatedMovies.id,
                          title: widget.topRatedMovies.title,
                          backdropPath: widget.topRatedMovies.backdropPath,
                          posterPath: widget.topRatedMovies.posterPath,
                          releaseDate: widget.topRatedMovies.releaseDate,
                          voteAverage: widget.topRatedMovies.voteAverage,
                          overview: widget.topRatedMovies.overview,
                          isWatchList: widget.topRatedMovies.isWatchList,
                        ),
                      );
                    }
                  },
                  icon: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 50,
                        color: widget.topRatedMovies.isWatchList
                            ? AppTheme.primary
                            : AppTheme.darkGray.withOpacity(.87),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: widget.topRatedMovies.isWatchList
                            ? const Icon(
                                Icons.check,
                                color: AppTheme.white,
                                size: 18,
                              )
                            : const Icon(
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
                      widget.topRatedMovies.voteAverage?.toStringAsFixed(2) ??
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
                  widget.topRatedMovies.title ?? "",
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
                  widget.topRatedMovies.releaseDate ?? "",
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
      ),
    );
  }
}
