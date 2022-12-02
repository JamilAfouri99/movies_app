import 'dart:developer';

import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<List<Movie>> getNowPlaying() async {
    try {
      return await baseMovieRemoteDataSource.getNowPlayingMovies();
    } catch (error) {
      log('error', error: error);
      throw error.toString();
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      return await baseMovieRemoteDataSource.getPopularMovies();
    } catch (error) {
      log('error', error: error);
      throw error.toString();
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    try {
      return await baseMovieRemoteDataSource.getTopRatedMovies();
    } catch (error) {
      log('error', error: error);
      throw error.toString();
    }
  }
}
