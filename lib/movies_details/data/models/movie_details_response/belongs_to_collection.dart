import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json[ApiKey.id] as int?,
      name: json[ApiKey.name] as String?,
      posterPath: json[ApiKey.posterPath] as String?,
      backdropPath: json[ApiKey.backdropPath] as String?,
    );
  }
}
