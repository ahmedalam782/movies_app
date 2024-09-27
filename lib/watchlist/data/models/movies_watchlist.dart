import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

class MoviesWatchlist {
  int? id;
  String? title;
  String? backdropPath;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  String? overview;
  bool isWatchList;

  MoviesWatchlist({
    this.id,
    this.title,
    this.backdropPath,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.overview,
    this.isWatchList = false,
  });

  factory MoviesWatchlist.fromJson(Map<String, dynamic> json) =>
      MoviesWatchlist(
        id: json[ApiKey.id],
        title: json[ApiKey.title],
        backdropPath: json[ApiKey.backdropPath],
        posterPath: json[ApiKey.posterPath],
        voteAverage: json[ApiKey.voteAverage],
        releaseDate: json[ApiKey.releaseDate],
        isWatchList: json[ApiKey.isWatchList],
        overview: json[ApiKey.overview],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.title: title,
        ApiKey.backdropPath: backdropPath,
        ApiKey.posterPath: posterPath,
        ApiKey.voteAverage: voteAverage,
        ApiKey.releaseDate: releaseDate,
        ApiKey.overview: overview,
        ApiKey.isWatchList: isWatchList,
      };
}
