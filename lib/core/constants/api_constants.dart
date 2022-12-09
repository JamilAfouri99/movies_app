abstract class ApiBaseConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String key = 'f59bf424ae1b06d64b50cc175fdd29d0';
}

abstract class ApiConstants {
  static const String nowPlayingMoviesPath = '/movie/now_playing?api_key=${ApiBaseConstants.key}';
  static const String popularMoviesPath = '/movie/popular?api_key=${ApiBaseConstants.key}';
  static const String topRatedMoviesPath = '/movie/top_rated?api_key=${ApiBaseConstants.key}';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
