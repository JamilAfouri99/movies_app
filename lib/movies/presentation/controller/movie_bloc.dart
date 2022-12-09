import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usercases/now_playing_movies.dart';
import 'package:movies_app/movies/presentation/controller/movie_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;

  MoviesBloc(this.nowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await nowPlayingMoviesUseCase.execute();

        emit(const MoviesState(nowPlayingState: RequestState.loading));
        try {
          emit(MoviesState(
            nowPlayingMovies: result,
            nowPlayingState: RequestState.success,
          ));
        } catch (error) {
          emit(MoviesState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: result.toString(),
          ));
        }
      },
    );
  }
}
