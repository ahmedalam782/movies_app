import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_category_details/data/models/movies_items.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../home_datails/view_model/movies_view_model.dart';
import '../../../movies_details/view/screens/movie_details_new.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';
import '../../../watchlist/data/models/movies_watchlist.dart';

class MoviesCategoryItem extends StatefulWidget {
  const MoviesCategoryItem({super.key, required this.moviesItems});

  final MoviesItems moviesItems;

  @override
  State<MoviesCategoryItem> createState() => _MoviesCategoryItemState();
}

class _MoviesCategoryItemState extends State<MoviesCategoryItem> {
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
          arguments: widget.moviesItems,
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
                            "${EndPoint.imageBaseUrl}${widget.moviesItems.backdropPath ?? widget.moviesItems.posterPath}",
                        placeholder: (context, url) => const LoadingIndicator(),
                        errorWidget: (_, __, ___) => const Icon(
                          Icons.image_not_supported,
                          color: AppTheme.white,
                        ),
                        height: 100,
                        width:
                            widget.moviesItems.backdropPath == null ? 100 : 150,
                      ),
                    ),
                    Positioned.directional(
                      textDirection: TextDirection.ltr,
                      top: widget.moviesItems.backdropPath == null
                          ? -14.5
                          : -6.5,
                      start:
                          widget.moviesItems.backdropPath == null ? -4 : -18.5,
                      child: IconButton(
                        onPressed: () async {
                          if (widget.moviesItems.isWatchList == false) {
                            widget.moviesItems.isWatchList = true;
                            setState(() {});
                            moviesViewModel.addMovies(
                              MoviesWatchlist(
                                id: widget.moviesItems.id,
                                title: widget.moviesItems.title,
                                backdropPath: widget.moviesItems.backdropPath,
                                posterPath: widget.moviesItems.posterPath,
                                releaseDate: widget.moviesItems.releaseDate,
                                voteAverage: widget.moviesItems.voteAverage,
                                overview: widget.moviesItems.overview,
                                isWatchList: widget.moviesItems.isWatchList,
                              ),
                              "Movie is Added successfully ",
                            );
                            await moviesViewModel.getPopularMovies();
                            await moviesViewModel.getUpcomingMovies();
                            await moviesViewModel.getTopRatedMovies();
                          }
                        },
                        icon: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              Icons.bookmark,
                              size: 50,
                              color: widget.moviesItems.isWatchList
                                  ? AppTheme.primary
                                  : AppTheme.darkGray.withOpacity(.87),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: widget.moviesItems.isWatchList
                                  ? Icon(
                                      Icons.check,
                                      color: AppTheme.white,
                                      size: 18,
                                    )
                                  : Icon(
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
                          widget.moviesItems.title ?? "",
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
                          widget.moviesItems.releaseDate ?? "",
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
                              widget.moviesItems.voteAverage
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
