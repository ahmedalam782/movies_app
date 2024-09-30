import 'package:movies_app_route/browse/data/models/genres_movies.dart';

abstract class BrowseData {
  Future<List<Genres>> getCategory();
}
