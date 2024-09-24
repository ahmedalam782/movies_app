import 'package:movies_app_route/shared/network/remote/end_point.dart';

import '../../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';

class SimilarResponse {
  int? page;
  List<SimilarMovies>? similarMovies;
  int? totalPages;
  int? totalResults;
  ErrorServerModel? errorServerModel;

  SimilarResponse(
      {this.page,
      this.similarMovies,
      this.totalPages,
      this.totalResults,
      this.errorServerModel});

  SimilarResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];

    similarMovies = json[ApiKey.results] == null
        ? null
        : (json[ApiKey.results] as List<dynamic>?)
            ?.map((e) => SimilarMovies.fromJson(e as Map<String, dynamic>))
            .toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    errorServerModel = ErrorServerModel.fromJson(json);
  }
}

class SimilarMovies {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  SimilarMovies(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  SimilarMovies.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<dynamic>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
