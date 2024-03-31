import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercomicvine/utils/bloc/series.dart';
import 'package:fluttercomicvine/utils/bloc/person.dart';
import 'package:fluttercomicvine/utils/bloc/episode.dart';
import 'package:fluttercomicvine/widget/episode.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttercomicvine/utils/bloc/character.dart';
import 'package:fluttercomicvine/widget/backbutton.dart';
import 'package:fluttercomicvine/widget/backgroundimage.dart';
import 'package:fluttercomicvine/widget/person.dart';
import 'package:fluttercomicvine/widget/rawinfo.dart';
import 'package:fluttercomicvine/widget/story.dart';
import 'package:fluttercomicvine/widget/tabs.dart';

class SerieDetailsPage extends StatelessWidget {
  final int id;

  const SerieDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineSeriesBloc>(
        create: (context) =>
            ComicVineSeriesBloc(id)..add(LoadComicVineSeriesEvent()),
        child: Scaffold(
          body: BlocBuilder<ComicVineSeriesBloc, ComicVineSeriesState>(
            builder: (context, state) {
              if (state is LoadedComicVineSeriesState) {
                return Stack(children: <Widget>[
                  BackgroundImage(
                      imageUrl: state.series.image?.mediumUrl ?? ''),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 16),
                        child: MyBackButton(
                          title: state.series.name!,
                          onClick: (event) => context.go('/'),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11, left: 16),
                        child: RawInfo(
                            date: state.series.startYear!,
                            imageURL: state.series.image?.smallUrl ?? '',
                            nomLivre: state.series.name,
                            nbEpisodes: state.series.countOfEpisodes!),
                      ),
                      Expanded(
                        child: Tabs(header: const [
                          'Histoire',
                          'Personnages',
                          'Episodes'
                        ], 
                        content: <Widget>[
                          Story(description: state.series.description ?? ''),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: state.series.characters!.map(
                                  (e) => BlocProvider<ComicVineCharacterBloc>(
                                    create: (context) =>ComicVineCharacterBloc(e.id!)..add(LoadComicVineCharacterEvent()),
                                    child: BlocBuilder<ComicVineCharacterBloc,ComicVineCharacterState>(
                                      builder: (context, state) {
                                        if (state is LoadedComicVineCharacterState) {
                                          return Container(
                                            padding: const EdgeInsets.only(
                                              left: 25, bottom: 15
                                            ),
                                            child: Person(
                                              name:state.character.name ?? '',
                                              imageURL: state.character.image?.smallUrl ??'',
                                              onClick: (event) => context.go('/'),
                                            )
                                          );
                                        } else if (state
                                            is ErrorComicVineCharacterState) {
                                          return Text(state.message);
                                        } else if (state
                                            is LoadingComicVineCharacterState) {
                                          return const CircularProgressIndicator();
                                        } else {
                                          return const Placeholder();
                                        }
                                      }
                                    )
                                  )
                                ).toList(),
                              ),
                            )
                          ),
                          // Episodes
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: state.series.episodes!.map(
                                  (e) => BlocProvider<ComicVineEpisodeBloc>(
                                    create: (context) =>ComicVineEpisodeBloc(e.id!)..add(LoadComicVineEpisodeEvent()),
                                    child: BlocBuilder<ComicVineEpisodeBloc,ComicVineEpisodeState>(
                                      builder: (context, state) {
                                        if (state is LoadedComicVineEpisodeState) {
                                          return Container(
                                            padding: const EdgeInsets.only(
                                              left: 16, right: 16, bottom: 15
                                            ),
                                            child: Episode(
                                              imageURL: state.episode.image?.smallUrl ??'',
                                              onClick: (event) => (), 
                                              content: state.episode.episodeNumber==null?'':'Episode #${state.episode.episodeNumber}',
                                              title: state.episode.name ?? '',
                                              date: state.episode.airDate ?? '',
                                            )
                                          );
                                        } else if (state
                                            is ErrorComicVineEpisodeState) {
                                          return Text(state.message);
                                        } else if (state
                                            is LoadingComicVineEpisodeState) {
                                          return const CircularProgressIndicator();
                                        } else {
                                          return const Placeholder();
                                        }
                                      }
                                    )
                                  )
                                ).toList(),
                              ),
                            )
                          ),
                        ]),
                      ),
                    ],
                  ),
                ]);
              } else if (state is ErrorComicVineSeriesState) {
                return Text(state.message);
              } else {
                return Container(
                  alignment:Alignment.center,
                  child: const CircularProgressIndicator()
                );
              }
            },
          ),
        ));
  }
}
