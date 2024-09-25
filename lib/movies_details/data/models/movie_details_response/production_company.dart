import 'package:movies_app_route/shared/network/remote/end_point.dart';

class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json[ApiKey.id] as int?,
      logoPath: json[ApiKey.logoPath] as String?,
      name: json[ApiKey.name] as String?,
      originCountry: json[ApiKey.originCountry] as String?,
    );
  }
}
