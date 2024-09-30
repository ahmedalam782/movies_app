import 'package:flutter/material.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/search/repository/search_repository.dart';

import '../../shared/service_locator.dart';
import '../../watchlist/data/models/movies_watchlist.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository repository;

  SearchViewModel()
      : repository = SearchRepository(
            ServiceLocator.searchData, ServiceLocator.moviesWatchlist);
  List<SearchResult> searchResult = [];
  String? errorMessage;
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;
  bool isLoadingPagination = false;
  List<MoviesWatchlist> moviesWatchlist = [];

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
      if (await repository.getSearchMovies(query, page) == []) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
      } else {
        searchResult.addAll(await repository.getSearchMovies(query, page));
        await getMovies();
        for (var moviesWatchlist in moviesWatchlist) {
          for (var searchResult in searchResult) {
            if (moviesWatchlist.id == searchResult.id) {
              searchResult.isWatchList = moviesWatchlist.isWatchList;
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
