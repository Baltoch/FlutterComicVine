import 'package:flutter/material.dart';
import 'package:fluttercomicvine/widget/information.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/movie.dart';
import 'package:fluttercomicvine/utils/bloc/character.dart';
import 'package:fluttercomicvine/widget/backbutton.dart';
import 'package:fluttercomicvine/widget/backgroundimage.dart';
import 'package:fluttercomicvine/widget/person.dart';
import 'package:fluttercomicvine/widget/rawinfo.dart';
import 'package:fluttercomicvine/widget/story.dart';
import 'package:fluttercomicvine/widget/tabs.dart';

class MovieDetailsPage extends StatelessWidget {
  final int id;

  const MovieDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineMovieBloc>(
        create: (context) =>
            ComicVineMovieBloc(id)..add(LoadComicVineMovieEvent()),
        child: Scaffold(
          body: BlocBuilder<ComicVineMovieBloc, ComicVineMovieState>(
            builder: (context, state) {
              if (state is LoadedComicVineMovieState) {
                return Stack(children: <Widget>[
                  BackgroundImage(imageUrl: state.movie.image?.mediumUrl ?? ''),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 24, left: 16),
                          child: MyBackButton(
                            title: state.movie.name ?? '',
                            onClick: (e) => context.go('/'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 11, left: 16),
                        child: RawInfo(
                          date: state.movie.dateAdded ?? '',
                          imageURL: state.movie.image?.smallUrl ?? '',
                          duree: state.movie.runtime,
                        ),
                      ),
                      Expanded(
                        child: Tabs(header: const [
                          'Synopsis',
                          'Personnages',
                          'Infos'
                        ], content: <Widget>[
                          Story(description: state.movie.description ?? ''),
                          SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Column(
                              children: state.movie.characters!
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
                          Information(data: {
                            'Classification': [state.movie.rating!],
                            'Réalisateur': state.movie.producers == null
                                ? []
                                : state.movie.producers!
                                    .map((e) => e.name ?? '')
                                    .toList(),
                            'Scénaristes': state.movie.writers == null
                                ? []
                                : state.movie.writers!
                                    .map((e) => e.name ?? '')
                                    .toList(),
                            'Producteurs': state.movie.producers == null
                                ? []
                                : state.movie.producers!
                                    .map((e) => e.name ?? '')
                                    .toList(),
                            'Studios': state.movie.studios == null
                                ? []
                                : state.movie.studios!
                                    .map((e) => e.name ?? '')
                                    .toList(),
                            'Budget': [state.movie.budget!],
                            'Recettes au box-office': [
                              state.movie.boxOfficeRevenue!
                            ],
                            'Recettes brutes totales': [
                              state.movie.totalRevenue!
                            ]
                          })
                        ]),
                      ),
                    ],
                  ),
                ]);
              } else if (state is ErrorComicVineMovieState) {
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
