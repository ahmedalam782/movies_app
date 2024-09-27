import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_details/view/screens/movie_details_new.dart';
import 'package:provider/provider.dart';
import '../../../home_datails/view_model/movies_view_model.dart';
import '../../../shared/Themes/app_theme.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/network/remote/api/end_point.dart';
import '../../../watchlist/data/models/movies_watchlist.dart';
import '../../data/models/similar_response/similarMovies.dart';
import '../../view_model/movies_view_model.dart';

class MoreLikeThis extends StatefulWidget {
  const MoreLikeThis({super.key, required this.similarResponse});

  final SimilarMovies similarResponse;

  @override
  State<MoreLikeThis> createState() => _MoreLikeThisState();
}

class _MoreLikeThisState extends State<MoreLikeThis> {
  @override
  Widget build(BuildContext context) {
    MoviesViewModel movieDetailsViewModel =
    Provider.of<MoviesViewModel>(context);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          MovieDetailsNew.routeName,
          arguments: widget.similarResponse,
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
                      "${EndPoint.imageBaseUrl}${widget.similarResponse.posterPath}",
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
                  onPressed: () async {
                    if (widget.similarResponse.isWatchList == false) {
                      widget.similarResponse.isWatchList = true;
                      setState(() {});
                      movieDetailsViewModel.addMovies(
                        MoviesWatchlist(
                          id: widget.similarResponse.id,
                          title: widget.similarResponse.title,
                          backdropPath: widget.similarResponse.backdropPath,
                          posterPath: widget.similarResponse.posterPath,
                          releaseDate: widget.similarResponse.releaseDate,
                          voteAverage: widget.similarResponse.voteAverage,
                          overview: widget.similarResponse.overview,
                          isWatchList: widget.similarResponse.isWatchList,
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
                        color: widget.similarResponse.isWatchList
                            ? AppTheme.primary
                            : AppTheme.darkGray.withOpacity(.87),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: widget.similarResponse.isWatchList
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
                      widget.similarResponse.voteAverage?.toStringAsFixed(1) ??
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
                  widget.similarResponse.title ?? "",
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
                  widget.similarResponse.releaseDate ?? "",
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
