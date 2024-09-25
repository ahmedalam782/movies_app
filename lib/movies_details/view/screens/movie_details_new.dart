import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view/widgets/recommended_movies.dart';
import 'package:movies_app_route/home_datails/view_model/movies_view_model.dart';
import 'package:movies_app_route/movies_details/data/models/movie_details_response/movie_details_response.dart';
import 'package:movies_app_route/movies_details/data/models/similar_response/similar_response.dart';
import 'package:movies_app_route/movies_details/view/screens/more_like_this.dart';
import 'package:movies_app_route/movies_details/view_model/movies_view_model.dart';

import 'package:movies_app_route/shared/components/custom_chip_categoryType.dart';
import 'package:movies_app_route/shared/components/error_indicator.dart';
import 'package:movies_app_route/shared/components/loading_indicator.dart';
import 'package:movies_app_route/shared/components/movies_container.dart';
import 'package:movies_app_route/shared/components/movies_image_components.dart';
import 'package:movies_app_route/shared/network/remote/end_point.dart';
import 'package:movies_app_route/shared/themes/app_theme.dart';
import 'package:provider/provider.dart';

class MovieDetailsNew extends StatefulWidget {
  MovieDetailsNew({Key? key}) : super(key: key);

  static const String routeName = '/movie_details_new';

  @override
  State<MovieDetailsNew> createState() => _MovieDetailsNewState();
}

class _MovieDetailsNewState extends State<MovieDetailsNew> {
  dynamic args;

  MovieDetailsViewModel moviesdetailsModel = MovieDetailsViewModel();
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments;
    if (isLoaded == false) {
      moviesdetailsModel.getMovieDetails(args.id);
      moviesdetailsModel.getSimilarMovies(args.id);
      isLoaded = true;
      setState(() {});
    }
    return ChangeNotifierProvider(
      create: (_) => moviesdetailsModel,
      child: Consumer<MovieDetailsViewModel>(
          builder: (_, moviesdetailsModel, __) => Scaffold(
                appBar: AppBar(
                  title: Text(args.title),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
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
                                errorWidget: (_, __, ___) =>
                                    const Icon(Icons.image_not_supported),
                                height: MediaQuery.sizeOf(context).height * .29,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/play.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(args.title,
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(args.releaseDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppTheme.gray)),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left side
                                Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 8, left: 10),
                                      child: MoviesImageComponents(
                                        image:
                                            "${EndPoint.imageBaseUrl}${args.posterPath}",
                                        backgroundBookmarkIcon:
                                            AppTheme.darkGray.withOpacity(.87),
                                      ),
                                    ),
                                    const Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.bookmark,
                                          color: AppTheme.darkGray,
                                          size: 50,
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: AppTheme.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),

                                // Right side
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        moviesdetailsModel.detailsIsLoading
                                            ? const LoadingIndicator()
                                            : moviesdetailsModel
                                                        .errorDetailsMessage !=
                                                    null
                                                ? ErrorIndicator(
                                                    message: moviesdetailsModel
                                                        .errorDetailsMessage,
                                                  )
                                                : CustomChipBuilderWidget(
                                                    movieDetails:
                                                        moviesdetailsModel
                                                            .genres),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        Text(
                                          args.overview,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          maxLines: 4,
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: AppTheme.primary,
                                              size: 26,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              args.voteAverage
                                                  .toStringAsFixed(1),
                                              style: TextStyle(
                                                  color: AppTheme.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      moviesdetailsModel.similarIsLoading
                          ? const LoadingIndicator()
                          : moviesdetailsModel.errorSimilarMessage != null
                              ? ErrorIndicator(
                                  message:
                                      moviesdetailsModel.errorSimilarMessage,
                                )
                              : MoviesContainer(
                                  categoryName: 'More Like This',
                                  height: 310,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (_, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemBuilder: (_, index) => MoreLikeThis(
                                      similarResponse: moviesdetailsModel
                                          .similarMovies[index],
                                    ),
                                    itemCount:
                                        moviesdetailsModel.similarMovies.length,
                                  ),
                                ),
                    ],
                  ),
                ),
              )),
    );
  }
}
