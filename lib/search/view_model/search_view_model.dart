import 'package:flutter/material.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/search/data/search_data/movies_search_api.dart';
import 'package:movies_app_route/search/data/search_data/search_data.dart';

class SearchViewModel extends ChangeNotifier {
  SearchData searchData = MoviesSearchApi();
  List<SearchResult> searchResult = [];
  String? errorMessage;
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;
  bool isLoadingPagination = false;

  Future<void> getSearchMovies(
    String query, {
    isLoadingFromPagination = false,
  }) async {
    if (isLoadingFromPagination == false) {
      isLoading = true;
      searchResult = [];
      page = 1;
      errorMessage = null;
      notifyListeners();
    } else {
      isLoadingPagination = true;
      notifyListeners();
    }
    try {
      if (await searchData.getSearchMovies(query, page) == []) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
      } else {
        searchResult.addAll(await searchData.getSearchMovies(query, page));
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
