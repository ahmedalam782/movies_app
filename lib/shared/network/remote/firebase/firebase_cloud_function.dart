import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app_route/watchlist/data/models/movies_watchlist.dart';

import 'firebase_cloud.dart';

class FirebaseCloudFunction implements FirebaseCloud {
  @override
  CollectionReference<MoviesWatchlist> getMoviesCollection() =>
      FirebaseFirestore.instance
          .collection("Movies")
          .withConverter<MoviesWatchlist>(
            fromFirestore: (dcSnapshot, option) =>
                MoviesWatchlist.fromJson(dcSnapshot.data()!),
            toFirestore: (moviesWatchlist, option) => moviesWatchlist.toJson(),
          );

  @override
  Future<void> addMoviesToFirebase(MoviesWatchlist moviesWatchlist) async {
    CollectionReference<MoviesWatchlist> collectionReference =
        getMoviesCollection();
    DocumentReference<MoviesWatchlist> documentReference =
        collectionReference.doc(moviesWatchlist.id.toString());
    return documentReference.set(moviesWatchlist);
  }

  @override
  Future<List<MoviesWatchlist>> getMoviesFromFirebase() async {
    CollectionReference<MoviesWatchlist> collectionReference =
        getMoviesCollection();
    QuerySnapshot<MoviesWatchlist> querySnapshot =
        await collectionReference.get();
    return querySnapshot.docs.map((dcSnapshot) => dcSnapshot.data()).toList();
  }

  @override
  Future<void> deleteMoviesFromFirebase(String id) async {
    CollectionReference<MoviesWatchlist> collectionReference =
        getMoviesCollection();
    return collectionReference.doc(id).delete();
  }

  @override
  Future<void> updateMoviesInFirebase(MoviesWatchlist moviesWatchlist) async {
    CollectionReference<MoviesWatchlist> collectionReference =
        getMoviesCollection();
    return collectionReference
        .doc(moviesWatchlist.id.toString())
        .update(moviesWatchlist.toJson());
  }
}
