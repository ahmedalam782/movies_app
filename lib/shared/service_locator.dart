import 'package:movies_app_route/shared/network/remote/firebase/firebase_cloud.dart';
import 'package:movies_app_route/shared/network/remote/firebase/firebase_cloud_function.dart';

import '../home_datails/data/home_data/movies_data.dart';
import '../home_datails/data/home_data/movies_popular_api.dart';
import '../movies_category_details/data/movies_category_data/movies_categories_api_data.dart';
import '../movies_category_details/data/movies_category_data/movies_category_details_data.dart';
import '../movies_details/data/movies_details_data/movies_data.dart';
import '../movies_details/data/movies_details_data/movies_details_api.dart';
import '../search/data/search_data/movies_search_api.dart';
import '../search/data/search_data/search_data.dart';
import 'network/remote/api/api_consumer.dart';
import 'network/remote/api/http_consumer.dart';

class ServiceLocator {
  static ApiConsumer apiConsumer = HttpConsumer();
  static MoviesData moviesData = MoviesPopularApi();
  static FirebaseCloud moviesWatchlist = FirebaseCloudFunction();
  static MoviesCategoryDetailsData moviesCategory = MoviesCategoriesApiData();
  static MoviesDataDetails moviesDataDetails = MoviesDetailsApi();
  static SearchData searchData = MoviesSearchApi();
}
