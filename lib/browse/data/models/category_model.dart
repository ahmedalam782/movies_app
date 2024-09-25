import 'package:movies_app_route/shared/network/remote/end_point.dart';

import '../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';
import 'genres_movies.dart';

class CategoryModel {
  final List<Genres>? genres;
  final ErrorServerModel? errorServerModel;

  const CategoryModel({this.genres, this.errorServerModel});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        genres: json[ApiKey.genres] == null
            ? null
            : (json[ApiKey.genres] as List<dynamic>?)
                ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
                .toList(),
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
