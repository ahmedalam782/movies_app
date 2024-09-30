import 'package:movies_app_route/home_datails/data/models/popular_models/popular_movies.dart';
import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

import '../../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';

class MoviesPopular {
  int? page;
  List<PopularMovies>? popularMovies;
  int? totalPages;
  int? totalResults;
  ErrorServerModel? errorServerModel;

  MoviesPopular({
    this.page,
    this.popularMovies,
    this.totalPages,
    this.totalResults,
    this.errorServerModel,
  });

  factory MoviesPopular.fromJson(Map<String, dynamic> json) => MoviesPopular(
        page: json[ApiKey.page] as int?,
        popularMovies: json[ApiKey.results] == null
            ? null
            : (json[ApiKey.results] as List<dynamic>?)
                ?.map((e) => PopularMovies.fromJson(e as Map<String, dynamic>))
                .toList(),
        totalPages: json[ApiKey.totalPages] as int?,
        totalResults: json[ApiKey.totalResults] as int?,
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
