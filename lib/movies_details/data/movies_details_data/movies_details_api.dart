import 'package:movies_app_route/movies_details/data/models/movie_details_response/genre.dart';
import 'package:movies_app_route/movies_details/data/models/movie_details_response/movie_details_response.dart';
import 'package:movies_app_route/movies_details/data/models/similar_response/similar_response.dart';
import 'package:movies_app_route/shared/service_locator.dart';

import '../../../shared/network/remote/api/end_point.dart';
import '../models/similar_response/similarMovies.dart';
import 'movies_data.dart';

class MoviesDetailsApi extends MoviesDataDetails {
  @override
  Future<List<Genre>> getMovieDetails(int movieId) async {
    final Uri url =
        Uri.http(EndPoint.baseUrl, "${EndPoint.movieDetails}$movieId");
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
    });
    MovieDetailsResponse moviesDetailsResponse =
        MovieDetailsResponse.fromJson(response);
    if (moviesDetailsResponse.genres != null) {
      return moviesDetailsResponse.genres!;
    } else if (moviesDetailsResponse.errorServerModel?.statusMessage != null ||
        moviesDetailsResponse.errorServerModel?.success == false) {
      throw Exception(moviesDetailsResponse.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get Movie Details ');
    }
  }

  @override
  Future<List<SimilarMovies>> getSimilarMovies(int movieId) async {
    final Uri url = Uri.http(EndPoint.baseUrl,
        "${EndPoint.movieDetails}$movieId${EndPoint.similar}");
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
    });
    SimilarResponse similarResponse = SimilarResponse.fromJson(response);
    if (similarResponse.similarMovies != null) {
      return similarResponse.similarMovies!;
    } else if (similarResponse.errorServerModel?.statusMessage != null ||
        similarResponse.errorServerModel?.success == false) {
      throw Exception(similarResponse.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get Similar Movies');
    }
  }
}
