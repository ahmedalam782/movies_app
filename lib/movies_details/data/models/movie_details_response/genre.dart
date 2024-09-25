import 'package:movies_app_route/shared/network/remote/end_point.dart';

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json[ApiKey.id] as int?,
        name: json[ApiKey.name] as String?,
      );
}
