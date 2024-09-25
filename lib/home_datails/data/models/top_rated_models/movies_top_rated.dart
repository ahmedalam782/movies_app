import 'package:movies_app_route/home_datails/data/models/top_rated_models/top_rated_movies.dart';
import 'package:movies_app_route/shared/network/remote/end_point.dart';

import '../../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';

class MoviesTopRated {
  int? page;
  List<TopRatedMovies>? topRatedMovies;
  int? totalPages;
  int? totalResults;
  ErrorServerModel? errorServerModel;

  MoviesTopRated({
    this.page,
    this.topRatedMovies,
    this.totalPages,
    this.totalResults,
    this.errorServerModel,
  });

  factory MoviesTopRated.fromJson(Map<String, dynamic> json) => MoviesTopRated(
        page: json[ApiKey.page] as int?,
        topRatedMovies: json[ApiKey.results] == null
            ? null
            : (json[ApiKey.results] as List<dynamic>?)
                ?.map((e) => TopRatedMovies.fromJson(e as Map<String, dynamic>))
                .toList(),
        totalPages: json[ApiKey.totalPages] as int?,
        totalResults: json[ApiKey.totalResults] as int?,
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
