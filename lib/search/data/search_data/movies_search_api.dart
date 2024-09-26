import 'package:movies_app_route/home_datails/data/home_data/movies_data.dart';
import 'package:movies_app_route/home_datails/data/models/popular_models/movies_popular.dart';
import 'package:movies_app_route/home_datails/data/models/popular_models/popular_movies.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/movies_top_rated.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';
import 'package:movies_app_route/search/data/models/movies_search.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/search/data/search_data/search_data.dart';

import 'package:movies_app_route/shared/service_locator.dart';

import '../../../shared/network/remote/end_point.dart';

class MoviesSearchApi extends SearchData {
  @override
  Future<List<SearchResult>> getSeachMovies(String query) async {
    final Uri url =
        Uri.http(EndPoint.baseUrl, EndPoint.topRated, {'query': query});
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
      ApiKey.accept: ApiKey.applicationJson,
    });
    MoviesSearch moviesSearch = MoviesSearch.fromJson(response);
    if (moviesSearch.searchResult != null) {
      return moviesSearch.searchResult!;
    } else if (moviesSearch.errorServerModel?.statusMessage != null ||
        moviesSearch.errorServerModel?.success == false) {
      throw Exception(moviesSearch.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get Search Movies');
    }
  }
}
