import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../home_datails/view_model/movies_view_model.dart';
import '../../../movies_details/view/screens/movie_details_new.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';
import '../../../watchlist/data/models/movies_watchlist.dart';

class MoviesCategoryItem extends StatefulWidget {
  const MoviesCategoryItem({super.key, required this.searchResult});

  final SearchResult searchResult;

  @override
  State<MoviesCategoryItem> createState() => _MoviesCategoryItemState();
}

class _MoviesCategoryItemState extends State<MoviesCategoryItem> {
  @override
  Widget build(BuildContext context) {
    MoviesViewModel movieDetailsViewModel =
        Provider.of<MoviesViewModel>(context);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: widget.searchResult,
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: width * .05,
          vertical: height * .01,
        ),
        child: Column(
          children: [
            Row(
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
                            "${EndPoint.imageBaseUrl}${widget.searchResult.backdropPath ?? widget.searchResult.posterPath}",
                        placeholder: (context, url) => const LoadingIndicator(),
                        errorWidget: (_, __, ___) => const Icon(
                          Icons.image_not_supported,
                          color: AppTheme.white,
                        ),
                        height: 100,
                        width: widget.searchResult.backdropPath == null
                            ? 100
                            : 150,
                      ),
                    ),
                    Positioned.directional(
                      textDirection: TextDirection.ltr,
                      top: widget.searchResult.backdropPath == null
                          ? -14.5
                          : -6.5,
                      start:
                          widget.searchResult.backdropPath == null ? -4 : -18.5,
                      child: IconButton(
                        onPressed: () async {
                          if (widget.searchResult.isWatchList == false) {
                            widget.searchResult.isWatchList = true;
                            setState(() {});
                            movieDetailsViewModel.addMovies(
                              MoviesWatchlist(
                                id: widget.searchResult.id,
                                title: widget.searchResult.title,
                                backdropPath: widget.searchResult.backdropPath,
                                posterPath: widget.searchResult.posterPath,
                                releaseDate: widget.searchResult.releaseDate,
                                voteAverage: widget.searchResult.voteAverage,
                                overview: widget.searchResult.overview,
                                isWatchList: widget.searchResult.isWatchList,
                              ),
                              "Movie is Added successfully ",
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
                              color: widget.searchResult.isWatchList
                                  ? AppTheme.primary
                                  : AppTheme.darkGray.withOpacity(.87),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: widget.searchResult.isWatchList
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
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: width * .06,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.searchResult.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Text(
                          widget.searchResult.releaseDate ?? "",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 13,
                                    color: AppTheme.white.withOpacity(.67),
                                  ),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
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
                              widget.searchResult.voteAverage
                                      ?.toStringAsFixed(1) ??
                                  "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 13,
                                    color: AppTheme.white.withOpacity(.67),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .001,
            ),
          ],
        ),
      ),
    );
  }
}
