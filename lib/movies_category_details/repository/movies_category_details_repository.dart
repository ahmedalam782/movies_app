import '../../shared/network/remote/firebase/firebase_cloud.dart';
import '../../watchlist/data/models/movies_watchlist.dart';
import '../data/models/movies_items.dart';
import '../data/movies_category_data/movies_category_details_data.dart';

class MoviesCategoryDetailsRepository {
  final MoviesCategoryDetailsData moviesCategoryDetailsData;
  final FirebaseCloud firebaseCloud;

  MoviesCategoryDetailsRepository(
      this.moviesCategoryDetailsData, this.firebaseCloud);

  Future<List<MoviesItems>> getMoviesCategoryDetails(
      String categoryId, int page) async {
    return await moviesCategoryDetailsData.getMoviesCategoryDetails(
        categoryId, page);
  }

  Future<List<MoviesWatchlist>> getMovies() async {
    return await firebaseCloud.getMoviesFromFirebase();
  }
}
