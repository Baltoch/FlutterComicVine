import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/character.dart';
import 'package:fluttercomicvine/widget/backbutton.dart';
import 'package:fluttercomicvine/widget/backgroundimage.dart';
import 'package:fluttercomicvine/widget/story.dart';
import 'package:fluttercomicvine/widget/tabs.dart';
import 'package:fluttercomicvine/widget/information.dart';

class CharacterDetailsPage extends StatelessWidget {
  final int id;

  const CharacterDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineCharacterBloc>(
        create: (context) =>
            ComicVineCharacterBloc(id)..add(LoadComicVineCharacterEvent()),
        child: Scaffold(
          body: BlocBuilder<ComicVineCharacterBloc, ComicVineCharacterState>(
            builder: (context, state) {
              if (state is LoadedComicVineCharacterState) {
                return Stack(children: <Widget>[
                  BackgroundImage(
                      imageUrl: state.character.image?.mediumUrl ?? ''),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 24, left: 16),
                          child: MyBackButton(
                            title: state.character.name ?? '',
                            onClick: (e) => context.go('/'),
                          )),
                      Expanded(
                        child: Tabs(header: const [
                          'Histoire',
                          'Infos'
                        ], content: <Widget>[
                          Story(description: state.character.description ?? ''),
                          Information(data: {
                            'Nom du super-héros': [state.character.name ?? ''],
                            'Nom réel': [state.character.name ?? ''],
                            'Alias': [state.character.aliases ?? ''],
                            'Editeur': [state.character.publisher?.name ?? ''],
                            'Créateurs': state.character.creators == null
                                ? []
                                : state.character.creators!
                                    .map((e) => e.name ?? '')
                                    .toList(),
                            'Genre': [
                              state.character.gender == 1
                                  ? 'Masculin'
                                  : 'Feminin'
                            ],
                          })
                        ]),
                      ),
                    ],
                  ),
                ]);
              } else if (state is ErrorComicVineCharacterState) {
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
