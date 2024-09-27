import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json[ApiKey.iso_3166_1] as String?,
      name: json[ApiKey.name] as String?,
    );
  }
}
