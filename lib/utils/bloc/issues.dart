import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineIssuesEvent {}

class LoadComicVineIssuesEvent extends ComicVineIssuesEvent {
  final int limit;

  LoadComicVineIssuesEvent(this.limit);
}

class QueryComicVineIssuesEvent extends ComicVineIssuesEvent {
  final int? limit;
  final String? query; 

  QueryComicVineIssuesEvent(this.limit, {this.query});
}

// States
abstract class ComicVineIssuesState {}

class LoadingComicVineIssuesState extends ComicVineIssuesState {}

class EmptyComicVineIssuesState extends ComicVineIssuesState {}

class LoadedComicVineIssuesState extends ComicVineIssuesState {
  final List<ComicVineIssuesItem> issues;

  LoadedComicVineIssuesState(this.issues);
}

class ErrorComicVineIssuesState extends ComicVineIssuesState {
  final String message;

  ErrorComicVineIssuesState(this.message);
}

// BLoC
class ComicVineIssuesBloc extends Bloc<ComicVineIssuesEvent, ComicVineIssuesState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();

  ComicVineIssuesBloc() : super(LoadingComicVineIssuesState()) {
    on<LoadComicVineIssuesEvent>((event, emit) async {
      emit(LoadingComicVineIssuesState());
      try {
        final issues = await _comicVineRequests.getIssues(event.limit);
        emit(LoadedComicVineIssuesState(issues.results));
      }
      catch (e) {
        emit(ErrorComicVineIssuesState('Failed to load issues: $e'));
      }
    });
    on<QueryComicVineIssuesEvent>((event, emit) async {
      emit(LoadingComicVineIssuesState());
      try {
        final issues = await _comicVineRequests.filterIssues(limit: event.limit, filter: event.query);
        if(issues.results.isEmpty) {
          emit(EmptyComicVineIssuesState());
        }
        else {
          emit(LoadedComicVineIssuesState(issues.results));
        }
      } 
      catch (e) {
        emit(ErrorComicVineIssuesState('Failed to query issues: $e'));
      }
    });
  }
}