import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/person.dart';
import 'package:fluttercomicvine/widget/backbutton.dart';
import 'package:fluttercomicvine/widget/backgroundimage.dart';
import 'package:fluttercomicvine/widget/story.dart';
import 'package:fluttercomicvine/widget/tabs.dart';
import 'package:fluttercomicvine/widget/information.dart';

class PersonDetailsPage extends StatelessWidget {
  final int id;

  const PersonDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVinePersonBloc>(
        create: (context) =>
            ComicVinePersonBloc(id)..add(LoadComicVinePersonEvent()),
        child: Scaffold(
          body: BlocBuilder<ComicVinePersonBloc, ComicVinePersonState>(
            builder: (context, state) {
              if (state is LoadedComicVinePersonState) {
                return Stack(children: <Widget>[
                  BackgroundImage(
                      imageUrl: state.person.image?.mediumUrl ?? ''),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 24, left: 16),
                          child: MyBackButton(
                            title: state.person.name ?? '',
                            onClick: (e) => context.go('/'),
                          )),
                      Expanded(
                        child: Tabs(header: const [
                          'Histoire',
                          'Infos'
                        ], content: <Widget>[
                          Story(description: state.person.description ?? ''),
                          Information(data: {
                            'Nom': [state.person.name ?? ''],
                            'Alias': [state.person.aliases ?? ''],
                            'Site web': [state.person.website ?? ''],
                            'Pays': [state.person.country ?? ''],
                            'Genre': [
                              state.person.gender == 1 ? 'Masculin' : 'Feminin'
                            ],
                            'Date de naissance': [state.person.birth ?? ''],
                            'Décès': [state.person.death?.date ?? ''],
                          }),
                        ]),
                      ),
                    ],
                  ),
                ]);
              } else if (state is ErrorComicVinePersonState) {
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
