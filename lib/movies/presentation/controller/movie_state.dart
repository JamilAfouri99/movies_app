import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState nowPlayingState;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = '',
    this.nowPlayingState = RequestState.loading,
  });

  @override
  List<Object?> get props => [nowPlayingMovies, nowPlayingMessage, nowPlayingState];
}
