import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json[ApiKey.maximum] as String?,
        minimum: json[ApiKey.minimum] as String?,
      );
}
