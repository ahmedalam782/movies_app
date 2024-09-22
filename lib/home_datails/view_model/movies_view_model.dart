import 'package:flutter/material.dart';
import 'package:movies_app_route/home_datails/data/home_data/movies_data.dart';
import 'package:movies_app_route/home_datails/data/home_data/movies_popular_api.dart';
import 'package:movies_app_route/home_datails/data/models/popular_models/popular_movies.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';
import 'package:movies_app_route/home_datails/data/models/upcoming_models/upcoming_movies.dart';

class MoviesViewModel extends ChangeNotifier {
  MoviesData moviesData = MoviesPopularApi();
  List<PopularMovies> popularMovies = [];
  String? errorPopularMessage;
  bool popularIsLoading = false;
  List<UpcomingMovies> upcomingMovies = [];
  String? errorUpcomingMessage;
  bool upcomingIsLoading = false;
  List<TopRatedMovies> topRatedMovies = [];
  String? errorTopRatedMessage;
  bool topRatedIsLoading = false;

  Future<void> getPopularMovies() async {
    popularIsLoading = true;
    notifyListeners();
    try {
      popularMovies = await moviesData.getPopularMovies();
    } catch (e) {
      errorPopularMessage = e.toString();
    }
    popularIsLoading = false;
    notifyListeners();
  }

  Future<void> getUpcomingMovies() async {
    upcomingIsLoading = true;
    notifyListeners();
    try {
      upcomingMovies = await moviesData.getUpcomingMovies();
    } catch (e) {
      errorUpcomingMessage = e.toString();
    }
    upcomingIsLoading = false;
    notifyListeners();
  }

  Future<void> getTopRatedMovies() async {
    topRatedIsLoading = true;
    notifyListeners();
    try {
      topRatedMovies = await moviesData.getTopRatedMovies();
    } catch (e) {
      errorTopRatedMessage = e.toString();
    }
    topRatedIsLoading = false;
    notifyListeners();
  }
}
