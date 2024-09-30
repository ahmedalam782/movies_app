import '../../shared/network/remote/firebase/firebase_cloud.dart';
import '../../watchlist/data/models/movies_watchlist.dart';
import '../data/models/movie_details_response/genre.dart';
import '../data/models/similar_response/similarMovies.dart';
import '../data/movies_details_data/movies_data.dart';

class MoviesDetailsRepository {
  final MoviesDataDetails moviesDataDetails;
  final FirebaseCloud firebaseCloud;

  MoviesDetailsRepository(this.moviesDataDetails, this.firebaseCloud);

  Future<List<Genre>> getMovieDetails(int movieId) async {
    return await moviesDataDetails.getMovieDetails(movieId);
  }

  Future<List<SimilarMovies>> getSimilarMovies(int movieId) async {
    return await moviesDataDetails.getSimilarMovies(movieId);
  }

  Future<List<MoviesWatchlist>> getMovies() async {
    return await firebaseCloud.getMoviesFromFirebase();
  }
}
