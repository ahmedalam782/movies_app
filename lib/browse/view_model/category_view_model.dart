import 'package:flutter/material.dart';
import 'package:movies_app_route/browse/data/browse_data/browse_data.dart';
import 'package:movies_app_route/browse/data/browse_data/categories_api_data.dart';
import 'package:movies_app_route/browse/data/models/genres_movies.dart';

class CategoryViewModel extends ChangeNotifier {
  BrowseData browseData = CategoriesApiData();
  List<Genres> categoryMovies = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getCategory() async {
    isLoading = true;
    notifyListeners();
    try {
      categoryMovies = await browseData.getCategory();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
