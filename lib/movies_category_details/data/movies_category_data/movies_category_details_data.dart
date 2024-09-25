import 'package:movies_app_route/movies_category_details/data/models/movies_items.dart';

abstract class MoviesCategoryDetailsData {
  Future<List<MoviesItems>> getMoviesCategoryDetails(String categoryId);
}
