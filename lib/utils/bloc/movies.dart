import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineMoviesEvent {}

class LoadComicVineMoviesEvent extends ComicVineMoviesEvent {}


// States
abstract class ComicVineMoviesState {}

class LoadingComicVineMoviesState extends ComicVineMoviesState {}

class LoadedComicVineMoviesState extends ComicVineMoviesState {
  final List<ComicVineMoviesItem> movies;

  LoadedComicVineMoviesState(this.movies);
}

class ErrorComicVineMoviesState extends ComicVineMoviesState {
  final String message;

  ErrorComicVineMoviesState(this.message);
}

// BLoC
class ComicVineMoviesBloc extends Bloc<ComicVineMoviesEvent, ComicVineMoviesState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int limit;

  ComicVineMoviesBloc(this.limit) : super(LoadingComicVineMoviesState()) {
    on<LoadComicVineMoviesEvent>((event, emit) async {
      emit(LoadingComicVineMoviesState());
      try {
        final movies = await _comicVineRequests.getMovies(limit);
        emit(LoadedComicVineMoviesState(movies.results));
      } 
      catch (e) {
        emit(ErrorComicVineMoviesState('Failed to load movies: $e'));
      }
    });
  }
}