import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class PopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  PopularMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
