import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineCharactersEvent {}

class QueryComicVineCharactersEvent extends ComicVineCharactersEvent {
  final int? limit;
  final String? query;

  QueryComicVineCharactersEvent(this.limit, {this.query});
}

// States
abstract class ComicVineCharactersState {}

class LoadingComicVineCharactersState extends ComicVineCharactersState {}

class EmptyComicVineCharactersState extends ComicVineCharactersState {}

class LoadedComicVineCharactersState extends ComicVineCharactersState {
  final List<ComicVineCharactersItems> characters;

  LoadedComicVineCharactersState(this.characters);
}

class ErrorComicVineCharactersState extends ComicVineCharactersState {
  final String message;

  ErrorComicVineCharactersState(this.message);
}

// BLoC
class ComicVineCharactersBloc
    extends Bloc<ComicVineCharactersEvent, ComicVineCharactersState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();

  ComicVineCharactersBloc() : super(LoadingComicVineCharactersState()) {
    on<QueryComicVineCharactersEvent>((event, emit) async {
      emit(LoadingComicVineCharactersState());
      try {
        final characters = await _comicVineRequests.filterCharacters(
            limit: event.limit, filter: event.query);
        if (characters.results.isEmpty) {
          emit(EmptyComicVineCharactersState());
        } else {
          emit(LoadedComicVineCharactersState(characters.results));
        }
      } catch (e) {
        emit(ErrorComicVineCharactersState('Failed to query characters: $e'));
      }
    });
  }
}
