import '../home_datails/data/home_data/movies_data.dart';
import '../home_datails/data/home_data/movies_popular_api.dart';
import 'network/remote/api_consumer.dart';
import 'network/remote/http_consumer.dart';

class ServiceLocator {
  static ApiConsumer apiConsumer = HttpConsumer();
  static MoviesData moviesData = MoviesPopularApi();
}
