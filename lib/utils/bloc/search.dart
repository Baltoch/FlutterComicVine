import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class SearchEvent {}

class QuerySearchEvent extends SearchEvent {
  final String query;

  QuerySearchEvent({required this.query});
}

// States
abstract class SearchState {}

class EmptySearchState extends SearchState {}

class QuerySearchState extends SearchState {
  final String query;

  QuerySearchState(this.query);
}

class ErrorSearchState extends SearchState {
  final String message;

  ErrorSearchState(this.message);
}

// BLoC
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(EmptySearchState()) {
    on<QuerySearchEvent>((event, emit) async {
      emit(EmptySearchState());
      try {
        emit(QuerySearchState(event.query));
      } 
      catch (e) {
        emit(ErrorSearchState(e.toString()));
      }
    });
  }
}