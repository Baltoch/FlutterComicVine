import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVinePersonEvent {}

class LoadComicVinePersonEvent extends ComicVinePersonEvent {}


// States
abstract class ComicVinePersonState {}

class LoadingComicVinePersonState extends ComicVinePersonState {}

class LoadedComicVinePersonState extends ComicVinePersonState {
  final ComicVinePerson person;

  LoadedComicVinePersonState(this.person);
}

class ErrorComicVinePersonState extends ComicVinePersonState {
  final String message;

  ErrorComicVinePersonState(this.message);
}

// BLoC
class ComicVinePersonBloc extends Bloc<ComicVinePersonEvent, ComicVinePersonState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int id;

  ComicVinePersonBloc(this.id) : super(LoadingComicVinePersonState()) {
    on<LoadComicVinePersonEvent>((event, emit) async {
      emit(LoadingComicVinePersonState());
      try {
        final person = await _comicVineRequests.getPerson(id);
        emit(LoadedComicVinePersonState(person.results));
      } 
      catch (e) {
        emit(ErrorComicVinePersonState('Failed to load person: $e'));
      }
    });
  }
}