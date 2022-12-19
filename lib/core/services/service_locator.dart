import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usercases/now_playing_movies.dart';
import 'package:movies_app/movies/domain/usercases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usercases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Use cases
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));

    // Use cases
    sl.registerLazySingleton(() => NowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => PopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => TopRatedMoviesUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

    // Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}
