import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_category_details/data/models/movies_items.dart';
import 'package:movies_app_route/movies_category_details/data/movies_category_data/movies_categories_api_data.dart';

import '../../shared/service_locator.dart';
import '../../watchlist/data/models/movies_watchlist.dart';
import '../data/movies_category_data/movies_category_details_data.dart';

class MoviesCategoryDetailsViewModel extends ChangeNotifier {
  MoviesCategoryDetailsData moviesCategory = MoviesCategoriesApiData();
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
      if (await moviesCategory.getMoviesCategoryDetails(categoryId, page) ==
          []) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
      } else {
        moviesItems.addAll(
            await moviesCategory.getMoviesCategoryDetails(categoryId, page));
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
    moviesWatchlist =
        await ServiceLocator.firebaseCloud.getMoviesFromFirebase();
    notifyListeners();
  }
}
