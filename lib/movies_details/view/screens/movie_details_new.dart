import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_details/view/widgets/more_like_this.dart';
import 'package:movies_app_route/movies_details/view_model/movies_view_model.dart';

import 'package:movies_app_route/shared/components/error_indicator.dart';
import 'package:movies_app_route/shared/components/loading_indicator.dart';
import 'package:movies_app_route/shared/components/movies_container.dart';
import 'package:movies_app_route/shared/network/remote/api/end_point.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../shared/components/custom_chip_category_type.dart';
import '../widgets/images_movies.dart';

class MovieDetailsNew extends StatefulWidget {
  const MovieDetailsNew({super.key});

  static const String routeName = '/movie_details_new';

  @override
  State<MovieDetailsNew> createState() => _MovieDetailsNewState();
}

class _MovieDetailsNewState extends State<MovieDetailsNew> {
  dynamic args;

  MovieDetailsViewModel moviesDetailsModel = MovieDetailsViewModel();
  bool isLoaded = false;
  bool isShowDetails = false;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments;
    if (isLoaded == false) {
      moviesDetailsModel.getMovieDetails(args.id);
      moviesDetailsModel.getSimilarMovies(args.id);
      isLoaded = true;
      setState(() {});
    }
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return ChangeNotifierProvider(
      create: (_) => moviesDetailsModel,
      child: Consumer<MovieDetailsViewModel>(
          builder: (_, moviesDetailsModel, __) => Scaffold(
                appBar: AppBar(
                  title: Text(args.title ?? ""),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.25,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${EndPoint.imageBaseUrl}${args.backdropPath}",
                                placeholder: (context, url) =>
                                    const LoadingIndicator(),
                                errorWidget: (_, __, ___) => const Icon(
                                  Icons.image_not_supported,
                                  color: AppTheme.primary,
                                ),
                                height: height * .29,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.play_circle,
                                color: AppTheme.white,
                                size: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              args.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 18),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              args.releaseDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppTheme.gray, fontSize: 10),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImagesMovies(
                                  movies: args,
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                // Right side
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      moviesDetailsModel.detailsIsLoading
                                          ? const LoadingIndicator()
                                          : moviesDetailsModel
                                                      .errorDetailsMessage !=
                                                  null
                                              ? ErrorIndicator(
                                                  message: moviesDetailsModel
                                                      .errorDetailsMessage,
                                                )
                                              : CustomChipBuilderWidget(
                                                  movieDetails:
                                                      moviesDetailsModel
                                                          .genres),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        args.overview,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                        maxLines: isShowDetails ? null : 4,
                                        overflow: isShowDetails
                                            ? TextOverflow.visible
                                            : TextOverflow.ellipsis,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          isShowDetails = !isShowDetails;
                                          setState(() {});
                                        },
                                        child: Text(
                                          isShowDetails
                                              ? "See Less"
                                              : "See More",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: AppTheme.primary,
                                            size: 26,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            args.voteAverage.toStringAsFixed(1),
                                            style: const TextStyle(
                                                color: AppTheme.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      moviesDetailsModel.similarIsLoading
                          ? const SizedBox(
                              height: 310,
                              child: LoadingIndicator(),
                            )
                          : moviesDetailsModel.errorSimilarMessage != null
                              ? ErrorIndicator(
                                  message:
                                      moviesDetailsModel.errorSimilarMessage,
                                )
                              : moviesDetailsModel.similarMovies.isNotEmpty
                                  ? MoviesContainer(
                                      categoryName: 'More Like This',
                                      height: 310,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (_, index) =>
                                            const SizedBox(
                                          width: 10,
                                        ),
                                        itemBuilder: (_, index) => MoreLikeThis(
                                          similarResponse: moviesDetailsModel
                                              .similarMovies[index],
                                        ),
                                        itemCount: moviesDetailsModel
                                            .similarMovies.length,
                                      ),
                                    )
                                  : const SizedBox()
                    ],
                  ),
                ),
              )),
    );
  }
}
