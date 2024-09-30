import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view_model/movies_view_model.dart';
import 'package:movies_app_route/movies_details/view/screens/movie_details_new.dart';
import 'package:movies_app_route/watchlist/data/models/movies_watchlist.dart';
import 'package:provider/provider.dart';

import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';

class ReleasesMovies extends StatefulWidget {
  const ReleasesMovies({super.key, required this.upcomingMovies});

  final dynamic upcomingMovies;

  @override
  State<ReleasesMovies> createState() => _ReleasesMoviesState();
}

class _ReleasesMoviesState extends State<ReleasesMovies> {
  @override
  Widget build(BuildContext context) {
    MoviesViewModel moviesViewModel = Provider.of<MoviesViewModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: widget.upcomingMovies,
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
                      "${EndPoint.imageBaseUrl}${widget.upcomingMovies.posterPath}",
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
                    if (widget.upcomingMovies.isWatchList == false) {
                      widget.upcomingMovies.isWatchList = true;
                      setState(() {});
                      moviesViewModel.addMovies(
                        MoviesWatchlist(
                          id: widget.upcomingMovies.id,
                          title: widget.upcomingMovies.title,
                          backdropPath: widget.upcomingMovies.backdropPath,
                          posterPath: widget.upcomingMovies.posterPath,
                          releaseDate: widget.upcomingMovies.releaseDate,
                          voteAverage: widget.upcomingMovies.voteAverage,
                          overview: widget.upcomingMovies.overview,
                          isWatchList: widget.upcomingMovies.isWatchList,
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
                        color: widget.upcomingMovies.isWatchList
                            ? AppTheme.primary
                            : AppTheme.darkGray.withOpacity(.87),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: widget.upcomingMovies.isWatchList
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
      ),
    );
  }
}
