import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app_route/watchlist/data/models/movies_watchlist.dart';

abstract class FirebaseCloud {
  CollectionReference<MoviesWatchlist> getMoviesCollection();

  Future<void> addMoviesToFirebase(MoviesWatchlist moviesWatchlist);

  Future<List<MoviesWatchlist>> getMoviesFromFirebase();

  Future<void> deleteMoviesFromFirebase(String id);

  Future<void> updateMoviesInFirebase(MoviesWatchlist moviesWatchlist);
}
