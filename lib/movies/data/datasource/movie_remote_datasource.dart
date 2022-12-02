import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/network/http/http_service.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  final httpService = HttpService(ApiBaseConstants.baseUrl);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() {
    return httpService.getRequest(
        path: ApiConstants.nowPlayingMoviesPath,
        queryParameters: {'api_key': ApiBaseConstants.key},
        expectedResponseModel: (response) {
          return List<MovieModel>.from(
            (response['results'] as List).map(
              (movie) => MovieModel.fromJson(movie),
            ),
          );
        });
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return httpService.getRequest(
      path: ApiConstants.popularMoviesPath,
      queryParameters: {'api_key': ApiBaseConstants.key},
      expectedResponseModel: (response) => List<MovieModel>.from(
        (response['results'] as List).map(
          (movie) => MovieModel.fromJson(movie),
        ),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    return httpService.getRequest(
      path: ApiConstants.topRatedMoviesPath,
      queryParameters: {'api_key': ApiBaseConstants.key},
      expectedResponseModel: (response) => List<MovieModel>.from(
        (response['results'] as List).map(
          (movie) => MovieModel.fromJson(movie),
        ),
      ),
    );
  }
}
