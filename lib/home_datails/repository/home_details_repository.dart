import '../../shared/network/remote/firebase/firebase_cloud.dart';
import '../../watchlist/data/models/movies_watchlist.dart';
import '../data/home_data/movies_data.dart';
import '../data/models/popular_models/popular_movies.dart';
import '../data/models/top_rated_models/top_rated_movies.dart';
import '../data/models/upcoming_models/upcoming_movies.dart';

class HomeDetailsRepository {
  final MoviesData moviesData;
  final FirebaseCloud firebaseCloud;

  HomeDetailsRepository(this.moviesData, this.firebaseCloud);

  Future<List<PopularMovies>> getPopularMovies() async {
    return await moviesData.getPopularMovies();
  }

  Future<List<UpcomingMovies>> getUpcomingMovies() async {
    return await moviesData.getUpcomingMovies();
  }

  Future<List<TopRatedMovies>> getTopRatedMovies() async {
    return await moviesData.getTopRatedMovies();
  }

  Future<void> addMovies(MoviesWatchlist moviesWatchlist) async {
    return await firebaseCloud.addMoviesToFirebase(moviesWatchlist);
  }

  Future<List<MoviesWatchlist>> getMovies() async {
    return await firebaseCloud.getMoviesFromFirebase();
  }

  Future<void> deleteMovies(String id) async {
    return await firebaseCloud.deleteMoviesFromFirebase(id);
  }
}
