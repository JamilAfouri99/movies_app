import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class TopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  TopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return baseMoviesRepository.getTopRatedMovies();
  }
}
