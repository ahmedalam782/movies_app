import 'package:movies_app_route/shared/Exceptions/Error_Server_Model/error_server_model.dart';
import 'package:movies_app_route/shared/network/remote/api/end_point.dart';

import 'belongs_to_collection.dart';
import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';

class MovieDetailsResponse {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<dynamic>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  ErrorServerModel? errorServerModel;

  MovieDetailsResponse({
    this.errorServerModel,
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      adult: json[ApiKey.adult] as bool?,
      errorServerModel: ErrorServerModel.fromJson(json),
      backdropPath: json[ApiKey.backdropPath] as String?,
      belongsToCollection: json[ApiKey.belongsToCollection] == null
          ? null
          : BelongsToCollection.fromJson(
              json[ApiKey.belongsToCollection] as Map<String, dynamic>),
      budget: json[ApiKey.budget] as int?,
      genres: json[ApiKey.genres] == null
          ? null
          : (json[ApiKey.genres] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList(),
      homepage: json[ApiKey.homepage] as String?,
      id: json[ApiKey.id] as int?,
      imdbId: json[ApiKey.imdbId] as String?,
      originCountry: json[ApiKey.originCountry] as List<dynamic>?,
      originalLanguage: json[ApiKey.originalLanguage] as String?,
      originalTitle: json[ApiKey.originalTitle] as String?,
      overview: json[ApiKey.overview] as String?,
      popularity: (json[ApiKey.popularity] as num?)?.toDouble(),
      posterPath: json[ApiKey.posterPath] as String?,
      productionCompanies: json[ApiKey.productionCompanies] == null
          ? null
          : (json[ApiKey.productionCompanies] as List<dynamic>?)
              ?.map(
                  (e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
              .toList(),
      productionCountries: json[ApiKey.productionCountries] == null
          ? null
          : (json[ApiKey.productionCountries] as List<dynamic>?)
              ?.map(
                  (e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
              .toList(),
      releaseDate: json[ApiKey.releaseDate] as String?,
      revenue: json[ApiKey.revenue] as int?,
      runtime: json[ApiKey.runtime] as int?,
      spokenLanguages: json[ApiKey.spokenLanguages] == null
          ? null
          : (json[ApiKey.spokenLanguages] as List<dynamic>?)
              ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
              .toList(),
      status: json[ApiKey.status] as String?,
      tagline: json[ApiKey.tagline] as String?,
      title: json[ApiKey.title] as String?,
      video: json[ApiKey.video] as bool?,
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble(),
      voteCount: json[ApiKey.voteCount] as int?,
    );
  }
}
