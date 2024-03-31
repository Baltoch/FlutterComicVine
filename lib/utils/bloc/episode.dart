import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineEpisodeEvent {}

class LoadComicVineEpisodeEvent extends ComicVineEpisodeEvent {}


// States
abstract class ComicVineEpisodeState {}

class LoadingComicVineEpisodeState extends ComicVineEpisodeState {}

class LoadedComicVineEpisodeState extends ComicVineEpisodeState {
  final ComicVineEpisode episode;

  LoadedComicVineEpisodeState(this.episode);
}

class ErrorComicVineEpisodeState extends ComicVineEpisodeState {
  final String message;

  ErrorComicVineEpisodeState(this.message);
}

// BLoC
class ComicVineEpisodeBloc extends Bloc<ComicVineEpisodeEvent, ComicVineEpisodeState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int id;

  ComicVineEpisodeBloc(this.id) : super(LoadingComicVineEpisodeState()) {
    on<LoadComicVineEpisodeEvent>((event, emit) async {
      emit(LoadingComicVineEpisodeState());
      try {
        final episode = await _comicVineRequests.getEpisode(id);
        emit(LoadedComicVineEpisodeState(episode.results));
      } 
      catch (e) {
        emit(ErrorComicVineEpisodeState('Failed to load episode: $e'));
      }
    });
  }
}