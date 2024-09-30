import '../../shared/network/remote/firebase/firebase_cloud.dart';
import '../../watchlist/data/models/movies_watchlist.dart';
import '../data/models/search_result.dart';
import '../data/search_data/search_data.dart';

class SearchRepository {
  final SearchData searchData;
  final FirebaseCloud firebaseCloud;

  SearchRepository(this.searchData, this.firebaseCloud);

  Future<List<SearchResult>> getSearchMovies(String query, int page) async {
    return await searchData.getSearchMovies(query, page);
  }

  Future<List<MoviesWatchlist>> getMovies() async {
    return await firebaseCloud.getMoviesFromFirebase();
  }
}
