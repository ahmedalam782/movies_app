import 'package:movies_app_route/shared/network/remote/firebase/firebase_cloud.dart';
import 'package:movies_app_route/shared/network/remote/firebase/firebase_cloud_function.dart';

import '../home_datails/data/home_data/movies_data.dart';
import '../home_datails/data/home_data/movies_popular_api.dart';
import 'network/remote/api/api_consumer.dart';
import 'network/remote/api/http_consumer.dart';

class ServiceLocator {
  static ApiConsumer apiConsumer = HttpConsumer();
  static MoviesData moviesData = MoviesPopularApi();
  static FirebaseCloud firebaseCloud = FirebaseCloudFunction();
}
