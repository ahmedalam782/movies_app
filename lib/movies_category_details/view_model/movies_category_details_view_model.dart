import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_category_details/data/models/movies_items.dart';
import 'package:movies_app_route/movies_category_details/repository/movies_category_details_repository.dart';

import '../../shared/service_locator.dart';
import '../../watchlist/data/models/movies_watchlist.dart';

class MoviesCategoryDetailsViewModel extends ChangeNotifier {
  final MoviesCategoryDetailsRepository repository;

  MoviesCategoryDetailsViewModel()
      : repository = MoviesCategoryDetailsRepository(
            ServiceLocator.moviesCategory, ServiceLocator.moviesWatchlist);
  List<MoviesItems> moviesItems = [];
  String? errorMessage;
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;
  bool isLoadingPagination = false;
  List<MoviesWatchlist> moviesWatchlist = [];

  Future<void> getMoviesCategoryDetails(
    String categoryId, {
    bool isLoadingFromPagination = false,
  }) async {
    if (isLoadingFromPagination == false) {
      isLoading = true;
      moviesItems = [];
      page = 1;
      errorMessage = null;
      notifyListeners();
    } else {
      isLoadingPagination = true;
      notifyListeners();
    }
    try {
      if (await repository.getMoviesCategoryDetails(categoryId, page) == []) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
      } else {
        moviesItems.addAll(
            await repository.getMoviesCategoryDetails(categoryId, page));
        await getMovies();
        for (var moviesWatchlist in moviesWatchlist) {
          for (var moviesItems in moviesItems) {
            if (moviesWatchlist.id == moviesItems.id) {
              moviesItems.isWatchList = moviesWatchlist.isWatchList;
            }
          }
        }
        isLoadingPagination = false;
        hasMore = true;
        page++;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMovies() async {
    moviesWatchlist = await repository.getMovies();
    notifyListeners();
  }
}
