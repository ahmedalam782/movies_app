import 'package:movies_app_route/shared/network/remote/end_point.dart';

class SpokenLanguage {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json[ApiKey.englishName] as String?,
      iso6391: json[ApiKey.iso_639_1] as String?,
      name: json[ApiKey.name] as String?,
    );
  }
}
