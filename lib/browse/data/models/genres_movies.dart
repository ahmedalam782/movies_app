
import '../../../shared/network/remote/api/end_point.dart';

class Genres {
  final int? id;
  final String? name;

  Genres({
    this.id,
    this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
    id: json[ApiKey.id],
    name: json[ApiKey.name],
  );
}