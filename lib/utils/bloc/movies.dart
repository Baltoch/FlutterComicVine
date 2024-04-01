import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineMoviesEvent {}

class LoadComicVineMoviesEvent extends ComicVineMoviesEvent {
  final int limit;

  LoadComicVineMoviesEvent(this.limit);
}

class QueryComicVineMoviesEvent extends ComicVineMoviesEvent {
  final int? limit;
  final String? query; 

  QueryComicVineMoviesEvent(this.limit, {this.query});
}


// States
abstract class ComicVineMoviesState {}

class LoadingComicVineMoviesState extends ComicVineMoviesState {}

class EmptyComicVineMoviesState extends ComicVineMoviesState {}

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

  ComicVineMoviesBloc() : super(LoadingComicVineMoviesState()) {
    on<LoadComicVineMoviesEvent>((event, emit) async {
      emit(LoadingComicVineMoviesState());
      try {
        final movies = await _comicVineRequests.getMovies(event.limit);
        emit(LoadedComicVineMoviesState(movies.results));
      } 
      catch (e) {
        emit(ErrorComicVineMoviesState('Failed to load movies: $e'));
      }
    });
    on<QueryComicVineMoviesEvent>((event, emit) async {
      emit(LoadingComicVineMoviesState());
      try {
        final movies = await _comicVineRequests.filterMovies(limit: event.limit, filter: event.query);
        if(movies.results.isEmpty) {
          emit(EmptyComicVineMoviesState());
        }
        else {
          emit(LoadedComicVineMoviesState(movies.results));
        }
      } 
      catch (e) {
        emit(ErrorComicVineMoviesState('Failed to query movies: $e'));
      }
    });
  }
}