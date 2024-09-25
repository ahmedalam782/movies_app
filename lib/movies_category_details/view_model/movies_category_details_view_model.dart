import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_category_details/data/models/movies_items.dart';
import 'package:movies_app_route/movies_category_details/data/movies_category_data/movies_categories_api_data.dart';

import '../data/movies_category_data/movies_category_details_data.dart';

class MoviesCategoryDetailsViewModel extends ChangeNotifier {
  MoviesCategoryDetailsData moviesCategory = MoviesCategoriesApiData();
  List<MoviesItems> moviesItems = [];
  String? errorMessage;
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;
  bool isLoadingPagination = false;

  Future<void> getMoviesCategoryDetails(
    String categoryId, {
    bool isLoadingFromPagination = false,
  }) async {
    if (isLoadingFromPagination) {
      isLoadingPagination = isLoadingFromPagination;
      notifyListeners();
    } else {
      isLoading = true;
      moviesItems = [];
      page = 1;
      errorMessage = null;
      notifyListeners();
    }
    try {
      if (await moviesCategory.getMoviesCategoryDetails(
              categoryId, page.toString()) ==
          []) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
      } else {
        moviesItems.addAll(await moviesCategory.getMoviesCategoryDetails(
            categoryId, page.toString()));
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
}
