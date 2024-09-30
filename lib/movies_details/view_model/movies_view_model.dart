import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_details/data/models/movie_details_response/genre.dart';
import 'package:movies_app_route/movies_details/repository/movies_details_repository.dart';

import '../../shared/service_locator.dart';
import '../../watchlist/data/models/movies_watchlist.dart';
import '../data/models/similar_response/similarMovies.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  final MoviesDetailsRepository repository;

  MovieDetailsViewModel()
      : repository = MoviesDetailsRepository(
            ServiceLocator.moviesDataDetails, ServiceLocator.moviesWatchlist);

  String? errorDetailsMessage;
  bool detailsIsLoading = false;
  List<Genre> genres = [];

  List<SimilarMovies> similarMovies = [];
  String? errorSimilarMessage;
  bool similarIsLoading = false;
  List<MoviesWatchlist> moviesWatchlist = [];

  Future<void> getMovieDetails(int movieId) async {
    detailsIsLoading = true;
    notifyListeners();
    try {
      genres = await repository.getMovieDetails(movieId);
    } catch (e) {
      errorDetailsMessage = e.toString();
    }
    detailsIsLoading = false;
    notifyListeners();
  }

  Future<void> getSimilarMovies(int movieId) async {
    similarIsLoading = true;
    notifyListeners();
    try {
      similarMovies = await repository.getSimilarMovies(movieId);
      await getMovies();
      for (var moviesWatchlist in moviesWatchlist) {
        for (var similarMovies in similarMovies) {
          if (moviesWatchlist.id == similarMovies.id) {
            similarMovies.isWatchList = moviesWatchlist.isWatchList;
          }
        }
      }
    } catch (e) {
      errorSimilarMessage = e.toString();
    }
    similarIsLoading = false;
    notifyListeners();
  }

  Future<void> getMovies() async {
    moviesWatchlist = await repository.getMovies();
    notifyListeners();
  }
}
