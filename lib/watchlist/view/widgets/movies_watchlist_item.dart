import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:movies_app_route/watchlist/data/models/movies_watchlist.dart';
import 'package:provider/provider.dart';

import '../../../home_datails/view_model/movies_view_model.dart';
import '../../../movies_details/view/screens/movie_details_new.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';

class MoviesWatchlistItem extends StatelessWidget {
  const MoviesWatchlistItem({super.key, required this.moviesWatchlist});

  final MoviesWatchlist moviesWatchlist;

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
          arguments: moviesWatchlist,
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: width * .05,
          vertical: height * .01,
        ),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.6,
            children: [
              SlidableAction(
                onPressed: (_) {
                  moviesViewModel.deleteMovies(
                    moviesWatchlist.id.toString(),
                  );
                },
                spacing: 8,
                backgroundColor: Colors.red,
                foregroundColor: AppTheme.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(15),
              ),
            ],
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
                              "${EndPoint.imageBaseUrl}${moviesWatchlist.backdropPath ?? moviesWatchlist.posterPath}",
                          placeholder: (context, url) =>
                              const LoadingIndicator(),
                          errorWidget: (_, __, ___) => const Icon(
                            Icons.image_not_supported,
                            color: AppTheme.white,
                          ),
                          height: 100,
                          width:
                              moviesWatchlist.backdropPath == null ? 100 : 150,
                        ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        top:
                            moviesWatchlist.backdropPath == null ? -14.5 : -6.5,
                        start:
                            moviesWatchlist.backdropPath == null ? -4 : -18.5,
                        child: IconButton(
                          onPressed: () {
                            moviesViewModel.deleteMovies(
                              moviesWatchlist.id.toString(),
                            );
                          },
                          icon: const Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Icons.bookmark,
                                size: 50,
                                color: AppTheme.primary,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                ),
                                child: Icon(
                                  Icons.check,
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
                            moviesWatchlist.title ?? "",
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
                            moviesWatchlist.releaseDate ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
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
                                moviesWatchlist.voteAverage
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
      ),
    );
  }
}
