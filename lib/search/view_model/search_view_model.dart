import 'package:flutter/material.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/search/data/search_data/movies_search_api.dart';
import 'package:movies_app_route/search/data/search_data/search_data.dart';

class SearchViewModel extends ChangeNotifier {
  SearchData searchData = MoviesSearchApi();
  List<SearchResult> searchResult = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSearchMovies(String query) async {
    isLoading = true;
    notifyListeners();
    try {
      searchResult = await searchData.getSeachMovies(query);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
