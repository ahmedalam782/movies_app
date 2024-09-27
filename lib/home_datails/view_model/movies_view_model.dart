import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app_route/home_datails/data/home_data/movies_data.dart';
import 'package:movies_app_route/home_datails/data/home_data/movies_popular_api.dart';
import 'package:movies_app_route/home_datails/data/models/popular_models/popular_movies.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';
import 'package:movies_app_route/home_datails/data/models/upcoming_models/upcoming_movies.dart';
import 'package:movies_app_route/shared/service_locator.dart';
import 'package:movies_app_route/watchlist/data/models/movies_watchlist.dart';

import '../../shared/Themes/app_theme.dart';

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
  List<MoviesWatchlist> moviesWatchlist = [];

  Future<void> getPopularMovies() async {
    popularIsLoading = true;
    notifyListeners();
    try {
      popularMovies = await moviesData.getPopularMovies();
      await getMovies();
      for (var moviesWatchlist in moviesWatchlist) {
        for (var popularMovies in popularMovies) {
          if (moviesWatchlist.id == popularMovies.id) {
            popularMovies.isWatchList = moviesWatchlist.isWatchList;
          }
        }
      }
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
      await getMovies();
      for (var moviesWatchlist in moviesWatchlist) {
        for (var upcomingMovies in upcomingMovies) {
          if (moviesWatchlist.id == upcomingMovies.id) {
            upcomingMovies.isWatchList = moviesWatchlist.isWatchList;
          }
        }
      }
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
      await getMovies();
      for (var moviesWatchlist in moviesWatchlist) {
        for (var topRatedMovies in topRatedMovies) {
          if (moviesWatchlist.id == topRatedMovies.id) {
            topRatedMovies.isWatchList = moviesWatchlist.isWatchList;
          }
        }
      }
    } catch (e) {
      errorTopRatedMessage = e.toString();
    }
    topRatedIsLoading = false;
    notifyListeners();
  }

  Future<void> addMovies(MoviesWatchlist moviesWatchlist, String msg) async {
    await ServiceLocator.firebaseCloud
        .addMoviesToFirebase(moviesWatchlist)
        .then((onValue) {
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppTheme.green,
        textColor: AppTheme.black,
        fontSize: 22.0,
      );
    }).catchError(
      (onError) {
        Fluttertoast.showToast(
          msg: onError.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppTheme.green,
          textColor: AppTheme.black,
          fontSize: 22.0,
        );
      },
    );

    await getMovies();
    notifyListeners();
  }

  Future<void> getMovies() async {
    moviesWatchlist =
        await ServiceLocator.firebaseCloud.getMoviesFromFirebase();
    notifyListeners();
  }

  deleteMovies(String id) async {
    await ServiceLocator.firebaseCloud.deleteMoviesFromFirebase(id);
    await getPopularMovies();
    await getUpcomingMovies();
    await getTopRatedMovies();
    await getMovies();
    notifyListeners();
  }
}
