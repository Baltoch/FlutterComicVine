import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineMovieEvent {}

class LoadComicVineMovieEvent extends ComicVineMovieEvent {}


// States
abstract class ComicVineMovieState {}

class LoadingComicVineMovieState extends ComicVineMovieState {}

class LoadedComicVineMovieState extends ComicVineMovieState {
  final ComicVineMovie movie;

  LoadedComicVineMovieState(this.movie);
}

class ErrorComicVineMovieState extends ComicVineMovieState {
  final String message;

  ErrorComicVineMovieState(this.message);
}

// BLoC
class ComicVineMovieBloc extends Bloc<ComicVineMovieEvent, ComicVineMovieState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int id;

  ComicVineMovieBloc(this.id) : super(LoadingComicVineMovieState()) {
    on<LoadComicVineMovieEvent>((event, emit) async {
      emit(LoadingComicVineMovieState());
      try {
        final movie = await _comicVineRequests.getMovie(id);
        emit(LoadedComicVineMovieState(movie.results));
      } 
      catch (e) {
        emit(ErrorComicVineMovieState('Failed to load movie: $e'));
      }
    });
  }
}