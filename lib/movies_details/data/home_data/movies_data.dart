import 'package:movies_app_route/home_datails/data/models/popular_models/popular_movies.dart';
import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';
import 'package:movies_app_route/home_datails/data/models/upcoming_models/upcoming_movies.dart';
import 'package:movies_app_route/movies_details/data/models/movie_details_response/genre.dart';
import 'package:movies_app_route/movies_details/data/models/movie_details_response/movie_details_response.dart';
import 'package:movies_app_route/movies_details/data/models/similar_response/similar_response.dart';

abstract class MoviesDataDetails {
  Future<List<Genre>> getMovieDetails(int movieId);
  Future<List<SimilarMovies>> getSimilarMovies(int movieId);
}
