import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usercases/now_playing_movies.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource = MovieRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMovieRemoteDataSource);
    NowPlayingMoviesUseCase nowPlayingMoviesUseCase = NowPlayingMoviesUseCase(baseMoviesRepository);
    final response = await nowPlayingMoviesUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
