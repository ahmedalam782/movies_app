import 'package:movies_app_route/search/data/models/search_result.dart';
import 'package:movies_app_route/shared/network/remote/end_point.dart';

import '../../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';

class MoviesSearch {
  int? page;
  List<SearchResult>? searchResult;
  int? totalPages;
  int? totalResults;
  ErrorServerModel? errorServerModel;

  MoviesSearch({
    this.page,
    this.searchResult,
    this.totalPages,
    this.totalResults,
    this.errorServerModel,
  });

  factory MoviesSearch.fromJson(Map<String, dynamic> json) => MoviesSearch(
        page: json[ApiKey.page] as int?,
        searchResult: json[ApiKey.results] == null
            ? null
            : (json[ApiKey.results] as List<dynamic>?)
                ?.map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
                .toList(),
        totalPages: json[ApiKey.totalPages] as int?,
        totalResults: json[ApiKey.totalResults] as int?,
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
