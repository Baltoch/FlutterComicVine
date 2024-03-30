import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/comicvine_api.dart';
import '../api/comicvine_model.dart';

// Events
abstract class ComicVineIssueEvent {}

class LoadComicVineIssueEvent extends ComicVineIssueEvent {}


// States
abstract class ComicVineIssueState {}

class LoadingComicVineIssueState extends ComicVineIssueState {}

class LoadedComicVineIssueState extends ComicVineIssueState {
  final ComicVineIssue issue;

  LoadedComicVineIssueState(this.issue);
}

class ErrorComicVineIssueState extends ComicVineIssueState {
  final String message;

  ErrorComicVineIssueState(this.message);
}

// BLoC
class ComicVineIssueBloc extends Bloc<ComicVineIssueEvent, ComicVineIssueState> {
  final ComicVineRequests _comicVineRequests = ComicVineRequests();
  final int id;

  ComicVineIssueBloc(this.id) : super(LoadingComicVineIssueState()) {
    on<LoadComicVineIssueEvent>((event, emit) async {
      emit(LoadingComicVineIssueState());
      try {
        final issue = await _comicVineRequests.getIssue(id);
        emit(LoadedComicVineIssueState(issue.results));
      } 
      catch (e) {
        emit(ErrorComicVineIssueState('Failed to load issue: $e'));
      }
    });
  }
}