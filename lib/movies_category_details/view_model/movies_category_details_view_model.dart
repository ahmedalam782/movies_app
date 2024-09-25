import 'package:flutter/material.dart';
import 'package:movies_app_route/movies_category_details/data/models/movies_items.dart';
import 'package:movies_app_route/movies_category_details/data/movies_category_data/movies_categories_api_data.dart';

import '../data/movies_category_data/movies_category_details_data.dart';

class MoviesCategoryDetailsViewModel extends ChangeNotifier {
  MoviesCategoryDetailsData moviesCategory = MoviesCategoriesApiData();
  List<MoviesItems> moviesItems = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getMoviesCategoryDetails(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      moviesItems = await moviesCategory.getMoviesCategoryDetails(categoryId);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
