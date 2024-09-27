import 'package:movies_app_route/home_datails/data/models/upcoming_models/upcoming_movies.dart';

import '../../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';
import '../../../../shared/network/remote/api/end_point.dart';
import 'dates_movies.dart';

class MoviesUpcoming {
  Dates? dates;
  int? page;
  List<UpcomingMovies>? upcomingMovies;
  int? totalPages;
  int? totalResults;
  ErrorServerModel? errorServerModel;

  MoviesUpcoming({
    this.dates,
    this.page,
    this.upcomingMovies,
    this.totalPages,
    this.totalResults,
    this.errorServerModel,
  });

  factory MoviesUpcoming.fromJson(Map<String, dynamic> json) => MoviesUpcoming(
        dates: json[ApiKey.dates] == null
            ? null
            : Dates.fromJson(json[ApiKey.dates]),
        page: json[ApiKey.page] as int?,
        upcomingMovies: json[ApiKey.results] == null
            ? null
            : (json[ApiKey.results] as List<dynamic>?)
                ?.map((e) => UpcomingMovies.fromJson(e as Map<String, dynamic>))
                .toList(),
        totalPages: json[ApiKey.totalPages] as int?,
        totalResults: json[ApiKey.totalResults] as int?,
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
