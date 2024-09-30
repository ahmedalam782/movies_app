import 'package:movies_app_route/movies_details/data/models/similar_response/similarMovies.dart';
import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

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

  factory SimilarResponse.fromJson(Map<String, dynamic> json) =>
      SimilarResponse(
        page: json[ApiKey.page],
        similarMovies: json[ApiKey.results] == null
            ? null
            : (json[ApiKey.results] as List<dynamic>?)
                ?.map((e) => SimilarMovies.fromJson(e as Map<String, dynamic>))
                .toList(),
        totalPages: json[ApiKey.totalPages],
        totalResults: json[ApiKey.totalResults],
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
