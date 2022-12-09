import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usercases/now_playing_movies.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    // Use cases
    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator()));

    // Use cases
    serviceLocator.registerLazySingleton(() => NowPlayingMoviesUseCase(serviceLocator()));

    // Repository
    serviceLocator
        .registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(serviceLocator()));

    // Data source
    serviceLocator.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}
