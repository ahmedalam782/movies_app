import 'package:movies_app_route/search/data/models/search_result.dart';

abstract class SearchData {
  Future<List<SearchResult>> getSearchMovies(String query, int page);
}
