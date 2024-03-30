import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineCharacterEvent {}

class LoadComicVineCharacterEvent extends ComicVineCharacterEvent {}


// States
abstract class ComicVineCharacterState {}

class LoadingComicVineCharacterState extends ComicVineCharacterState {}

class LoadedComicVineCharacterState extends ComicVineCharacterState {
  final ComicVineCharacter character;

  LoadedComicVineCharacterState(this.character);
}

class ErrorComicVineCharacterState extends ComicVineCharacterState {
  final String message;

  ErrorComicVineCharacterState(this.message);
}

// BLoC
class ComicVineCharacterBloc extends Bloc<ComicVineCharacterEvent, ComicVineCharacterState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int id;

  ComicVineCharacterBloc(this.id) : super(LoadingComicVineCharacterState()) {
    on<LoadComicVineCharacterEvent>((event, emit) async {
      emit(LoadingComicVineCharacterState());
      try {
        final character = await _comicVineRequests.getCharacter(id);
        emit(LoadedComicVineCharacterState(character.results));
      } 
      catch (e) {
        emit(ErrorComicVineCharacterState('Failed to load character: $e'));
      }
    });
  }
}