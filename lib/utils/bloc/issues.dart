import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineIssuesEvent {}

class LoadComicVineIssuesEvent extends ComicVineIssuesEvent {}


// States
abstract class ComicVineIssuesState {}

class LoadingComicVineIssuesState extends ComicVineIssuesState {}

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
        final issues = await _comicVineRequests.getIssues();
        emit(LoadedComicVineIssuesState(issues.results));
      }
      catch (e) {
        emit(ErrorComicVineIssuesState('Failed to load issues: $e'));
      }
    });
  }
}