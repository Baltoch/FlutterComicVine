import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineSeriesEvent {}

class LoadComicVineSeriesEvent extends ComicVineSeriesEvent {}


// States
abstract class ComicVineSeriesState {}

class LoadingComicVineSeriesState extends ComicVineSeriesState {}

class LoadedComicVineSeriesState extends ComicVineSeriesState {
  final ComicVineSeries series;

  LoadedComicVineSeriesState(this.series);
}

class ErrorComicVineSeriesState extends ComicVineSeriesState {
  final String message;

  ErrorComicVineSeriesState(this.message);
}

// BLoC
class ComicVineSeriesBloc extends Bloc<ComicVineSeriesEvent, ComicVineSeriesState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int id;

  ComicVineSeriesBloc(this.id) : super(LoadingComicVineSeriesState()) {
    on<LoadComicVineSeriesEvent>((event, emit) async {
      emit(LoadingComicVineSeriesState());
      try {
        final series = await _comicVineRequests.getSeries(id);
        emit(LoadedComicVineSeriesState(series.results));
      } 
      catch (e) {
        emit(ErrorComicVineSeriesState('Failed to load series: $e'));
      }
    });
  }
}