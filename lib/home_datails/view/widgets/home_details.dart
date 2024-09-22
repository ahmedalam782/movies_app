import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/view/widgets/movies_slider_items.dart';
import 'package:movies_app_route/home_datails/view/widgets/recommended_movies.dart';
import 'package:movies_app_route/home_datails/view/widgets/releases_movies.dart';
import 'package:provider/provider.dart';
import '../../../shared/components/error_indicator.dart';
import '../../../shared/components/loading_indicator.dart';
import '../../../shared/components/movies_container.dart';

import '../../view_model/movies_view_model.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  MoviesViewModel moviesViewModel = MoviesViewModel();

  @override
  void initState() {
    moviesViewModel.getPopularMovies();
    moviesViewModel.getUpcomingMovies();
    moviesViewModel.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return ChangeNotifierProvider(
      create: (_) => moviesViewModel,
      child: Consumer<MoviesViewModel>(
        builder: (_, moviesViewModel, __) {
          return SafeArea(
            child: ListView(
              children: [
                moviesViewModel.popularIsLoading
                    ? const LoadingIndicator()
                    : moviesViewModel.errorPopularMessage != null
                        ? ErrorIndicator(
                            message: moviesViewModel.errorPopularMessage,
                          )
                        : CarouselSlider.builder(
                            itemBuilder: (_, index, __) => MoviesSliderItems(
                              popularMovies:
                                  moviesViewModel.popularMovies[index],
                            ),
                            itemCount: moviesViewModel.popularMovies.length,
                            options: CarouselOptions(
                              height: height * .45,
                              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 3),
                            ),
                          ),
                moviesViewModel.upcomingIsLoading
                    ? const LoadingIndicator()
                    : moviesViewModel.errorUpcomingMessage != null
                        ? ErrorIndicator(
                            message: moviesViewModel.errorUpcomingMessage,
                          )
                        : MoviesContainer(
                            categoryName: 'New Releases ',
                            height: 225,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, index) => const SizedBox(
                                width: 10,
                              ),
                              itemBuilder: (_, index) => ReleasesMovies(
                                upcomingMovies:
                                    moviesViewModel.upcomingMovies[index],
                              ),
                              itemCount: moviesViewModel.upcomingMovies.length,
                            ),
                          ),
                SizedBox(
                  height: height * .03,
                ),
                moviesViewModel.topRatedIsLoading
                    ? const LoadingIndicator()
                    : moviesViewModel.errorTopRatedMessage != null
                        ? ErrorIndicator(
                            message: moviesViewModel.errorTopRatedMessage,
                          )
                        : MoviesContainer(
                            categoryName: 'Recommended',
                            height: 310,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, index) => const SizedBox(
                                width: 10,
                              ),
                              itemBuilder: (_, index) => RecommendedMovies(
                                topRatedMovies:
                                    moviesViewModel.topRatedMovies[index],
                              ),
                              itemCount: moviesViewModel.topRatedMovies.length,
                            ),
                          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
