import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/issue.dart';
import 'package:fluttercomicvine/widget/backbutton.dart';
import 'package:fluttercomicvine/widget/backgroundimage.dart';
import 'package:fluttercomicvine/widget/person.dart';
import 'package:fluttercomicvine/widget/rawinfo.dart';
import 'package:fluttercomicvine/widget/story.dart';
import 'package:fluttercomicvine/widget/tabs.dart';

class IssueDetailsPage extends StatelessWidget {
  final int id;
  final String title;

  const IssueDetailsPage({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineIssueBloc>(
        create: (context) =>
            ComicVineIssueBloc(id)..add(LoadComicVineIssueEvent()),
        child: Scaffold(
          body: BlocBuilder<ComicVineIssueBloc, ComicVineIssueState>(
            builder: (context, state) {
              if (state is LoadedComicVineIssueState) {
                return Stack(children: <Widget>[
                  BackgroundImage(imageUrl: state.issue.image?.mediumUrl ?? ''),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 24, left: 16),
                          child: MyBackButton(
                              title: state.issue.volume?.name ?? '')),
                      Padding(
                        padding: const EdgeInsets.only(top: 11, left: 16),
                        child: RawInfo(
                            date: state.issue.coverDate ?? '',
                            imageURL: state.issue.image?.smallUrl ?? '',
                            nomLivre: state.issue.name,
                            numeroLivre: state.issue.issueNumber),
                      ),
                      Expanded(
                        child: Tabs(header: [
                          'Histoire',
                          'Auteurs',
                          'Personnages'
                        ], content: <Widget>[
                          Story(description: state.issue.description ?? ''),
                          SingleChildScrollView(
                            child: Column(
                              children: state.issue.persons!
                                  .map((e) => Container(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 25, bottom: 15),
                                      child: Person(
                                          name: e.name ?? '',
                                          imageURL: e.image?.iconUrl ?? '')))
                                  .toList(),
                            ),
                          ),
                          Text('Personnages')
                        ]),
                      ),
                    ],
                  ),
                ]);
              } else if (state is ErrorComicVineIssueState) {
                return Text(state.message);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}

//MyBackButton(title: state.issue.volume?.name ?? '')
// BackgroundImage(imageUrl: state.issue.image?.screenUrl ?? '')
// RawInfo(
//   date: state.issue.coverDate ?? '',
//   imageURL: state.issue.image?.screenUrl ?? '',
//   nomLivre: state.issue.name,
//   numeroLivre: state.issue.issueNumber
// )
