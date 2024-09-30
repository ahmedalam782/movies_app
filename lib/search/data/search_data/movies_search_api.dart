import 'package:movies_app_route/search/data/models/movies_search.dart';
import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/search/data/search_data/search_data.dart';

import 'package:movies_app_route/shared/service_locator.dart';

import '../../../shared/network/remote/api/end_point.dart';

class MoviesSearchApi extends SearchData {
  @override
  Future<List<SearchResult>> getSearchMovies(String query, int page) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.searchMovies, {
      'query': query,
      'page': page.toString(),
    });
    if (page <= 500) {
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
    } else {
      throw Exception('Failed to get Search Movies');
    }
  }
}
