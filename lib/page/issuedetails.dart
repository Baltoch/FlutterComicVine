import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/issue.dart';
import 'package:fluttercomicvine/utils/bloc/person.dart';
import 'package:fluttercomicvine/utils/bloc/character.dart';
import 'package:fluttercomicvine/widget/backbutton.dart';
import 'package:fluttercomicvine/widget/backgroundimage.dart';
import 'package:fluttercomicvine/widget/person.dart';
import 'package:fluttercomicvine/widget/rawinfo.dart';
import 'package:fluttercomicvine/widget/story.dart';
import 'package:fluttercomicvine/widget/tabs.dart';

class IssueDetailsPage extends StatelessWidget {
  final int id;

  const IssueDetailsPage({super.key, required this.id});

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
                            title: state.issue.volume?.name ?? '',
                            onClick: (e) => context.go('/'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 11, left: 16),
                        child: RawInfo(
                            date: state.issue.coverDate ?? '',
                            imageURL: state.issue.image?.smallUrl ?? '',
                            nomLivre: state.issue.name,
                            numeroLivre: state.issue.issueNumber),
                      ),
                      Expanded(
                        child: Tabs(header: const [
                          'Histoire',
                          'Auteurs',
                          'Personnages'
                        ], content: <Widget>[
                          Story(description: state.issue.description ?? ''),
                          SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Column(
                              children: state.issue.persons!
                                  .map((e) => BlocProvider<ComicVinePersonBloc>(
                                      create: (context) =>
                                          ComicVinePersonBloc(e.id!)
                                            ..add(LoadComicVinePersonEvent()),
                                      child: BlocBuilder<ComicVinePersonBloc,
                                              ComicVinePersonState>(
                                          builder: (context, state) {
                                        if (state
                                            is LoadedComicVinePersonState) {
                                          return Container(
                                              padding: const EdgeInsets.only(
                                                  left: 25, bottom: 15),
                                              child: Person(
                                                name: state.person.name ?? '',
                                                imageURL: state.person.image
                                                        ?.smallUrl ??
                                                    '',
                                                title: e.role,
                                                onClick: (event) => context
                                                    .go('/person/${e.id}'),
                                              ));
                                        } else if (state
                                            is ErrorComicVinePersonState) {
                                          return Text(state.message);
                                        } else if (state
                                            is LoadingComicVinePersonState) {
                                          return Container(
                                              padding: const EdgeInsets.only(
                                                  left: 25, bottom: 15),
                                              child: const PersonSkeleton());
                                        } else {
                                          return const Placeholder();
                                        }
                                      })))
                                  .toList(),
                            ),
                          )),
                          SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Column(
                              children: state.issue.characters!
                                  .map((e) => BlocProvider<
                                          ComicVineCharacterBloc>(
                                      create: (context) =>
                                          ComicVineCharacterBloc(e.id!)
                                            ..add(
                                                LoadComicVineCharacterEvent()),
                                      child: BlocBuilder<ComicVineCharacterBloc,
                                              ComicVineCharacterState>(
                                          builder: (context, state) {
                                        if (state
                                            is LoadedComicVineCharacterState) {
                                          return Container(
                                              padding: const EdgeInsets.only(
                                                  left: 25, bottom: 15),
                                              child: Person(
                                                name:
                                                    state.character.name ?? '',
                                                imageURL: state.character.image
                                                        ?.smallUrl ??
                                                    '',
                                                onClick: (event) => context
                                                    .go('/character/${e.id}'),
                                              ));
                                        } else if (state
                                            is ErrorComicVineCharacterState) {
                                          return Text(state.message);
                                        } else if (state
                                            is LoadingComicVineCharacterState) {
                                          return Container(
                                              padding: const EdgeInsets.only(
                                                  left: 25, bottom: 15),
                                              child: const PersonSkeleton());
                                        } else {
                                          return const Placeholder();
                                        }
                                      })))
                                  .toList(),
                            ),
                          )),
                        ]),
                      ),
                    ],
                  ),
                ]);
              } else if (state is ErrorComicVineIssueState) {
                return Text(state.message);
              } else {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
