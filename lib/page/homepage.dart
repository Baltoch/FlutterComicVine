import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercomicvine/svg/app_vectorial_images.dart';
import 'package:fluttercomicvine/utils/bloc/search.dart';
import 'package:fluttercomicvine/widget/card.dart';
import 'package:go_router/go_router.dart';

import 'package:fluttercomicvine/utils/appcolors.dart';
import 'package:fluttercomicvine/utils/bloc/currentpageindex.dart';
import 'package:fluttercomicvine/utils/bloc/issues.dart';
import 'package:fluttercomicvine/utils/bloc/movies.dart';
import 'package:fluttercomicvine/utils/bloc/serieslist.dart';
import 'package:fluttercomicvine/widget/searchbar.dart';
import 'package:fluttercomicvine/widget/slider.dart';
import 'package:fluttercomicvine/widget/navbar.dart';
import 'package:fluttercomicvine/widget/title.dart';
import 'package:fluttercomicvine/widget/popular.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CurrentPageIndexCubit(),
        child: BlocBuilder<CurrentPageIndexCubit, int>(
          builder: (context, currentPageIndex) {
            return Scaffold(
              body: _HomePageBody(currentPageIndex: currentPageIndex),
              bottomNavigationBar: NavBar(
                  currentPageIndex: currentPageIndex,
                  setPageIndex: (index) =>
                      context.read<CurrentPageIndexCubit>().set(index)),
            );
          },
        ));
  }
}

class _HomePageBody extends StatelessWidget {
  final int currentPageIndex;

  const _HomePageBody({required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    switch (currentPageIndex) {
      case 0:
        return const _Home();
      case 1:
        return const _Comics();
      case 2:
        return const _Series();
      case 3:
        return const _Movies();
      case 4:
        return const _Search();
      default:
        return const Placeholder();
    }
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ComicVineIssuesBloc>(
              create: (context) =>
                  ComicVineIssuesBloc()..add(LoadComicVineIssuesEvent(5))),
          BlocProvider<ComicVineMoviesBloc>(
              create: (context) =>
                  ComicVineMoviesBloc()..add(LoadComicVineMoviesEvent(5))),
          BlocProvider<ComicVineSeriesListBloc>(
              create: (context) => ComicVineSeriesListBloc()
                ..add(LoadComicVineSeriesListEvent(5))),
        ],
        child: Stack(
          children: [
            Container(
                height: 192,
                padding: const EdgeInsets.only(
                    left: 32, right: 10, top: 16, bottom: 16),
                child: Row(
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTitle(content: "Bienvenue !"),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        SvgPicture.asset(AppVectorialImages.astronaut)
                      ],
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    const SizedBox(height: 192),
                    BlocBuilder<ComicVineSeriesListBloc,
                        ComicVineSeriesListState>(builder: (context, state) {
                      if (state is LoadedComicVineSeriesListState) {
                        return CardSlider(
                          onSeeMoreClick: () =>
                              BlocProvider.of<CurrentPageIndexCubit>(context)
                                ..set(2),
                          hasButton: true,
                          title: "Séries populaires",
                          cardList: state.seriesList
                              .map((e) => CardTemplate(
                                  imagePath: e.image?.smallUrl ?? '',
                                  description: e.name ?? '',
                                  onClick: (event) =>
                                      context.go('/series/${e.id}')))
                              .toList(),
                        );
                      } else if (state is ErrorComicVineSeriesListState) {
                        return Text(state.message);
                      } else if (state is LoadingComicVineSeriesListState) {
                        return const CardSliderSkeleton();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                    const SizedBox(height: 16),
                    BlocBuilder<ComicVineIssuesBloc, ComicVineIssuesState>(
                        builder: (context, state) {
                      if (state is LoadedComicVineIssuesState) {
                        return CardSlider(
                          onSeeMoreClick: () =>
                              BlocProvider.of<CurrentPageIndexCubit>(context)
                                ..set(1),
                          hasButton: true,
                          title: "Comics populaires",
                          cardList: state.issues
                              .map((e) => CardTemplate(
                                  imagePath: e.image?.smallUrl ?? '',
                                  description:
                                      '${e.volume?.name ?? ""} ${e.issueNumber == null ? "" : "#${e.issueNumber}"} ${e.name == null ? "" : "- ${e.name}"}',
                                  onClick: (event) =>
                                      context.go('/issue/${e.id}')))
                              .toList(),
                        );
                      } else if (state is ErrorComicVineIssuesState) {
                        return Text(state.message);
                      } else if (state is LoadingComicVineIssuesState) {
                        return const CardSliderSkeleton();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                    const SizedBox(height: 16),
                    BlocBuilder<ComicVineMoviesBloc, ComicVineMoviesState>(
                        builder: (context, state) {
                      if (state is LoadedComicVineMoviesState) {
                        return CardSlider(
                          onSeeMoreClick: () =>
                              BlocProvider.of<CurrentPageIndexCubit>(context)
                                ..set(3),
                          hasButton: true,
                          title: "Films populaires",
                          cardList: state.movies
                              .map((e) => CardTemplate(
                                  imagePath: e.image?.smallUrl ?? '',
                                  description: e.name ?? '',
                                  onClick: (event) =>
                                      context.go('/movie/${e.id}')))
                              .toList(),
                        );
                      } else if (state is ErrorComicVineMoviesState) {
                        return Text(state.message);
                      } else if (state is LoadingComicVineMoviesState) {
                        return const CardSliderSkeleton();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                    const SizedBox(height: 16)
                  ],
                )))
          ],
        ));
  }
}

class _Comics extends StatelessWidget {
  const _Comics();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineIssuesBloc>(
      create: (context) =>
          ComicVineIssuesBloc()..add(LoadComicVineIssuesEvent(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: const AppTitle(content: "Comics les plus populaires")),
            BlocBuilder<ComicVineIssuesBloc, ComicVineIssuesState>(
              builder: (context, state) {
                if (state is LoadedComicVineIssuesState) {
                  return Column(
                      children: state.issues
                          .asMap()
                          .entries
                          .map((e) => Container(
                              margin: const EdgeInsets.only(top: 21),
                              child: Popular(
                                title: e.value.volume?.name ?? '',
                                date: e.value.coverDate ?? '',
                                rank: '#${(e.key + 1).toString()}',
                                imageURL: e.value.image?.smallUrl ?? '',
                                nomLivre: e.value.name,
                                numeroLivre: e.value.issueNumber,
                                onClick: (event) =>
                                    context.go('/issue/${e.value.id}'),
                              )))
                          .toList());
                } else if (state is ErrorComicVineIssuesState) {
                  return Text(
                    state.message,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  );
                } else if (state is LoadingComicVineIssuesState) {
                  return Center(
                    child: Column(
                        children: List.generate(
                            30,
                            (index) => Container(
                                margin: const EdgeInsets.only(top: 21),
                                child: const PopularSkeleton()))),
                  );
                } else {
                  return const Placeholder();
                }
              },
            ),
            const SizedBox(height: 21)
          ]),
        ),
      ),
    );
  }
}

class _Series extends StatelessWidget {
  const _Series();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineSeriesListBloc>(
      create: (context) =>
          ComicVineSeriesListBloc()..add(LoadComicVineSeriesListEvent(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: const AppTitle(content: "Séries les plus populaires")),
            BlocBuilder<ComicVineSeriesListBloc, ComicVineSeriesListState>(
              builder: (context, state) {
                if (state is LoadedComicVineSeriesListState) {
                  return Column(
                      children: state.seriesList
                          .asMap()
                          .entries
                          .map((e) => Container(
                              margin: const EdgeInsets.only(top: 21),
                              child: Popular(
                                title: e.value.name ?? '',
                                date: e.value.startYear ?? '',
                                rank: '#${(e.key + 1).toString()}',
                                imageURL: e.value.image?.smallUrl ?? '',
                                nbEpisodes: e.value.countOfEpisodes.toString(),
                                edition: e.value.publisher?.name,
                                onClick: (event) =>
                                    context.go('/series/${e.value.id}'),
                              )))
                          .toList());
                } else if (state is ErrorComicVineSeriesListState) {
                  return Text(
                    state.message,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  );
                } else if (state is LoadingComicVineSeriesListState) {
                  return Center(
                    child: Column(
                        children: List.generate(
                            30,
                            (index) => Container(
                                margin: const EdgeInsets.only(top: 21),
                                child: const PopularSkeleton()))),
                  );
                } else {
                  return const Placeholder();
                }
              },
            ),
            const SizedBox(height: 21)
          ]),
        ),
      ),
    );
  }
}

class _Movies extends StatelessWidget {
  const _Movies();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineMoviesBloc>(
      create: (context) =>
          ComicVineMoviesBloc()..add(LoadComicVineMoviesEvent(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: const AppTitle(content: "Films les plus populaires")),
            BlocBuilder<ComicVineMoviesBloc, ComicVineMoviesState>(
              builder: (context, state) {
                if (state is LoadedComicVineMoviesState) {
                  return Column(
                      children: state.movies
                          .asMap()
                          .entries
                          .map((e) => Container(
                              margin: const EdgeInsets.only(top: 21),
                              child: Popular(
                                title: e.value.name ?? '',
                                date: e.value.dateAdded ?? '',
                                duree: e.value.runtime,
                                rank: '#${(e.key + 1).toString()}',
                                imageURL: e.value.image?.smallUrl ?? '',
                                onClick: (event) =>
                                    context.go('/movie/${e.value.id}'),
                              )))
                          .toList());
                } else if (state is ErrorComicVineMoviesState) {
                  return Text(
                    state.message,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  );
                } else if (state is LoadingComicVineMoviesState) {
                  return Center(
                    child: Column(
                        children: List.generate(
                            30,
                            (index) => Container(
                                margin: const EdgeInsets.only(top: 21),
                                child: const PopularSkeleton()))),
                  );
                } else {
                  return const Placeholder();
                }
              },
            ),
            const SizedBox(height: 21)
          ]),
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(),
        child: Stack(children: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is EmptySearchState) {
                return Center(
                  child: SizedBox(
                    height: 200,
                    width: 325,
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 325,
                          decoration: BoxDecoration(
                            color: AppColors.transparent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 125,
                            width: 325,
                            decoration: BoxDecoration(
                              color: AppColors.bgSearch,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 30, top: 30, bottom: 30, right: 95),
                              child: Center(
                                child: Text(
                                  "Saisissez une recherche pour trouver un comics, film, série ou personnage",
                                  style: TextStyle(color: AppColors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          height: 80,
                          top: 0,
                          right: -10,
                          child: SvgPicture.asset(AppVectorialImages.astronaut),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is QuerySearchState) {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider<ComicVineIssuesBloc>(
                          create: (context) => ComicVineIssuesBloc()
                            ..add(QueryComicVineIssuesEvent(5,
                                query: state.query))),
                      BlocProvider<ComicVineMoviesBloc>(
                          create: (context) => ComicVineMoviesBloc()
                            ..add(QueryComicVineMoviesEvent(5,
                                query: state.query))),
                      BlocProvider<ComicVineSeriesListBloc>(
                          create: (context) => ComicVineSeriesListBloc()
                            ..add(QueryComicVineSeriesListEvent(5,
                                query: state.query))),
                    ],
                    child: Builder(builder: (context) {
                      final stateIssues =
                          context.watch<ComicVineIssuesBloc>().state;
                      final stateMovies =
                          context.watch<ComicVineMoviesBloc>().state;
                      final stateSeriesList =
                          context.watch<ComicVineSeriesListBloc>().state;

                      if (stateIssues is LoadingComicVineIssuesState ||
                          stateMovies is LoadingComicVineMoviesState ||
                          stateSeriesList is LoadingComicVineSeriesListState) {
                        return Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        );
                      } else if (stateIssues is ErrorComicVineIssuesState ||
                          stateMovies is ErrorComicVineMoviesState ||
                          stateSeriesList is ErrorComicVineSeriesListState) {
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            '${stateIssues is ErrorComicVineIssuesState ? "${stateIssues.message} " : ""}${stateMovies is ErrorComicVineMoviesState ? "${stateMovies.message} " : ""}${stateSeriesList is ErrorComicVineSeriesListState ? "${stateSeriesList.message} " : ""}',
                            style: const TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SingleChildScrollView(
                                child: Column(
                              children: <Widget>[
                                const SizedBox(height: 192),
                                BlocBuilder<ComicVineSeriesListBloc,
                                        ComicVineSeriesListState>(
                                    builder: (context, state) {
                                  if (state is LoadedComicVineSeriesListState) {
                                    return CardSlider(
                                      onSeeMoreClick: () => (),
                                      hasButton: false,
                                      title: "Séries",
                                      cardList: state.seriesList
                                          .map((e) => CardTemplate(
                                              imagePath:
                                                  e.image?.smallUrl ?? '',
                                              description: e.name ?? '',
                                              onClick: (event) => context
                                                  .go('/series/${e.id}')))
                                          .toList(),
                                    );
                                  } else if (state
                                      is EmptyComicVineSeriesListState) {
                                    return const SizedBox(
                                      height: 0,
                                      width: 0,
                                    );
                                  } else {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator(),
                                    );
                                  }
                                }),
                                const SizedBox(height: 16),
                                BlocBuilder<ComicVineIssuesBloc,
                                        ComicVineIssuesState>(
                                    builder: (context, state) {
                                  if (state is LoadedComicVineIssuesState) {
                                    return CardSlider(
                                      onSeeMoreClick: () => (),
                                      hasButton: false,
                                      title: "Comics",
                                      cardList: state.issues
                                          .map((e) => CardTemplate(
                                              imagePath:
                                                  e.image?.smallUrl ?? '',
                                              description: e.name ?? '',
                                              onClick: (event) =>
                                                  context.go('/issue/${e.id}')))
                                          .toList(),
                                    );
                                  } else if (state
                                      is EmptyComicVineIssuesState) {
                                    return const SizedBox(
                                      height: 0,
                                      width: 0,
                                    );
                                  } else {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator(),
                                    );
                                  }
                                }),
                                const SizedBox(height: 16),
                                BlocBuilder<ComicVineMoviesBloc,
                                        ComicVineMoviesState>(
                                    builder: (context, state) {
                                  if (state is LoadedComicVineMoviesState) {
                                    return CardSlider(
                                      onSeeMoreClick: () => (),
                                      hasButton: false,
                                      title: "Films",
                                      cardList: state.movies
                                          .map((e) => CardTemplate(
                                              imagePath:
                                                  e.image?.smallUrl ?? '',
                                              description: e.name ?? '',
                                              onClick: (event) =>
                                                  context.go('/movie/${e.id}')))
                                          .toList(),
                                    );
                                  } else if (state
                                      is EmptyComicVineMoviesState) {
                                    return const SizedBox(
                                      height: 0,
                                      width: 0,
                                    );
                                  } else {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator(),
                                    );
                                  }
                                }),
                                const SizedBox(height: 16)
                              ],
                            )));
                      }
                    }));
              } else if (state is ErrorSearchState) {
                return Text(
                  state.message,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                );
              } else {
                return const Text(
                  'Unknown Error',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                );
              }
            },
          ),
          const _SearchBar(),
        ]));
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return AppSearchBar(
      onSubmitted: (query) => BlocProvider.of<SearchBloc>(context)
        ..add(QuerySearchEvent(query: query)),
      onChanged: (query) =>
          BlocProvider.of<SearchBloc>(context)..add(ChangedSearchEvent()),
    );
  }
}
