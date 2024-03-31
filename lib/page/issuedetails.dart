import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/issue.dart';

class IssueDetailsPage extends StatelessWidget {
  final int id;

  const IssueDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineIssueBloc>(
      create: (context) => ComicVineIssueBloc(id)..add(LoadComicVineIssueEvent()),
      child: BlocBuilder<ComicVineIssueBloc, ComicVineIssueState>(
        builder: (context, state) {
          if(state is LoadedComicVineIssueState) {
            return const Placeholder();
          }
          else if(state is ErrorComicVineIssueState) {
            return const Placeholder();
          }
          else if(state is LoadingComicVineIssueState) {
            return const Placeholder();
          }
          else {
            return const Placeholder();
          }
        },
      ),
    );
  }
}