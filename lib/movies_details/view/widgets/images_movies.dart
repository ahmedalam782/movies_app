import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';
import '../../../watchlist/data/models/movies_watchlist.dart';

class ImagesMovies extends StatefulWidget {
  const ImagesMovies({super.key, required this.movies});

  final dynamic movies;

  @override
  State<ImagesMovies> createState() => _ImagesMoviesState();
}

class _ImagesMoviesState extends State<ImagesMovies> {
  @override
  Widget build(BuildContext context) {
    MoviesViewModel movieDetailsViewModel =
        Provider.of<MoviesViewModel>(context);
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
                imageUrl: "${EndPoint.imageBaseUrl}${widget.movies.posterPath}",
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
                onPressed: () async {
                  if (widget.movies.isWatchList == false) {
                    widget.movies.isWatchList = true;
                    setState(() {});
                    movieDetailsViewModel.addMovies(
                      MoviesWatchlist(
                        id: widget.movies.id,
                        title: widget.movies.title,
                        backdropPath: widget.movies.backdropPath,
                        posterPath: widget.movies.posterPath,
                        releaseDate: widget.movies.releaseDate,
                        voteAverage: widget.movies.voteAverage,
                        overview: widget.movies.overview,
                        isWatchList: widget.movies.isWatchList,
                      ),
                    );
                    await movieDetailsViewModel.getPopularMovies();
                    await movieDetailsViewModel.getUpcomingMovies();
                    await movieDetailsViewModel.getTopRatedMovies();
                  }
                },
                icon: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.bookmark,
                      size: 50,
                      color: widget.movies.isWatchList
                          ? AppTheme.primary
                          : AppTheme.darkGray.withOpacity(.87),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: widget.movies.isWatchList
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
      ],
    );
  }
}
