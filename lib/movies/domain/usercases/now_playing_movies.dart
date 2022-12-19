import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class NowPlayingMoviesUseCase extends BaseUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  NowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<List<Movie>> call() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
