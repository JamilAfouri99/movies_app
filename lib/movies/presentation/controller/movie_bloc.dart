import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usercases/now_playing_movies.dart';
import 'package:movies_app/movies/domain/usercases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usercases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  final PopularMoviesUseCase popularMoviesUseCase;
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  MoviesBloc(
    this.nowPlayingMoviesUseCase,
    this.popularMoviesUseCase,
    this.topRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    try {
      emit(const MoviesState(nowPlayingState: RequestState.loading));
      final result = await nowPlayingMoviesUseCase();
      emit(state.copyWith(
        nowPlayingMovies: result,
        nowPlayingState: RequestState.success,
      ));
    } catch (error) {
      emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: error.toString(),
      ));
    }
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    try {
      emit(state.copyWith(popularState: RequestState.loading));
      final result = await popularMoviesUseCase();
      emit(state.copyWith(
        popularMovies: result,
        popularState: RequestState.success,
      ));
    } catch (error) {
      emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: error.toString(),
      ));
    }
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    try {
      emit(state.copyWith(topRatedState: RequestState.loading));
      final result = await topRatedMoviesUseCase();
      emit(state.copyWith(
        topRatedMovies: result,
        topRatedState: RequestState.success,
      ));
    } catch (error) {
      emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: error.toString(),
      ));
    }
  }
}
