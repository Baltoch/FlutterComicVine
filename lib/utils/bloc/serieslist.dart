import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineSeriesListEvent {}

class LoadComicVineSeriesListEvent extends ComicVineSeriesListEvent {
  final int limit;

  LoadComicVineSeriesListEvent(this.limit);
}


// States
abstract class ComicVineSeriesListState {}

class LoadingComicVineSeriesListState extends ComicVineSeriesListState {}

class LoadedComicVineSeriesListState extends ComicVineSeriesListState {
  final List<ComicVineSeriesItem> seriesList;

  LoadedComicVineSeriesListState(this.seriesList);
}

class ErrorComicVineSeriesListState extends ComicVineSeriesListState {
  final String message;

  ErrorComicVineSeriesListState(this.message);
}

// BLoC
class ComicVineSeriesListBloc extends Bloc<ComicVineSeriesListEvent, ComicVineSeriesListState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();

  ComicVineSeriesListBloc() : super(LoadingComicVineSeriesListState()) {
    on<LoadComicVineSeriesListEvent>((event, emit) async {
      emit(LoadingComicVineSeriesListState());
      try {
        final seriesList = await _comicVineRequests.getSeriesList(event.limit);
        emit(LoadedComicVineSeriesListState(seriesList.results));
      } 
      catch (e) {
        emit(ErrorComicVineSeriesListState('Failed to load series: $e'));
      }
    });
  }
}