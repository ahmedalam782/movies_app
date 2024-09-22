class EndPoint {
  static const String baseUrl = "api.themoviedb.org";
  static const String popular = "/3/movie/popular";
  static const String upcoming = "/3/movie/upcoming";
  static const String topRated = "/3/movie/top_rated";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
}

class ApiKey {
  static const String authorization = 'Authorization';
  static const String accept = 'accept';
  static const String applicationJson = 'application/json';
  static const String accessToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODU1N2M4YzEzYjE4ZDY1ZDIzZTRkZDUxNjkzMDBjNyIsIm5iZiI6MTcyNjg0MzQwNi40OTE5MjIsInN1YiI6IjY1NmZlM2Y1MzgzZGYyMDBlYjI2OTZjYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SmmODtjDRKiXPNDiveLTwlvC82t-912nSq4FKCxZAPo";
  static const String page = 'page';
  static const String results = 'results';
  static const String totalPages = 'total_pages';
  static const String totalResults = 'total_results';
  static const String adult = 'adult';
  static const String backdropPath = 'backdrop_path';
  static const String genreIds = 'genre_ids';
  static const String id = 'id';
  static const String originalLanguage = 'original_language';
  static const String originalTitle = 'original_title';
  static const String overview = 'overview';
  static const String popularity = 'popularity';
  static const String posterPath = 'poster_path';
  static const String releaseDate = 'release_date';
  static const String title = 'title';
  static const String video = 'video';
  static const String voteAverage = 'vote_average';
  static const String voteCount = 'vote_count';
  static const String success = 'success';
  static const String statusCode = 'status_code';
  static const String statusMessage = 'status_message';
  static const String dates = 'dates';
  static const String maximum = 'maximum';
  static const String minimum = 'minimum';
}
