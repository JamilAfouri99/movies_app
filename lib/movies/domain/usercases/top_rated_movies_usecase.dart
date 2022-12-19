import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class TopRatedMoviesUseCase extends BaseUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  TopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<List<Movie>> call() async {
    return baseMoviesRepository.getTopRatedMovies();
  }
}
