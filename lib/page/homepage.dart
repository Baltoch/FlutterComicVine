import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercomicvine/svg/app_vectorial_images.dart';
import 'package:fluttercomicvine/widget/card.dart';
import 'dart:ui';

import '../utils/appcolors.dart';
import '../utils/api/comicvine_model.dart';
import '../utils/api/comicvine_api.dart';
import '../utils/bloc/currentpageindex.dart';
import '../utils/bloc/issues.dart';
import '../utils/bloc/movies.dart';
import '../utils/bloc/serieslist.dart';
import '../widget/slider.dart';
import '../widget/episode.dart';
import '../widget/navbar.dart';
import '../widget/title.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});
  
   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentPageIndexCubit()),
        BlocProvider<ComicVineIssuesBloc>(create:(context) => ComicVineIssuesBloc(5)..add(LoadComicVineIssuesEvent())),
        BlocProvider<ComicVineMoviesBloc>(create:(context) => ComicVineMoviesBloc(5)..add(LoadComicVineMoviesEvent())),
        BlocProvider<ComicVineSeriesListBloc>(create:(context) => ComicVineSeriesListBloc(5)..add(LoadComicVineSeriesListEvent())),
      ],
      child: BlocBuilder<CurrentPageIndexCubit, int>(
        builder: (context, currentPageIndex) {
          return Scaffold(
            body: _HomePageBody(currentPageIndex: currentPageIndex),
            bottomNavigationBar: NavBar(currentPageIndex: currentPageIndex, setPageIndex: (index) => context.read<CurrentPageIndexCubit>().set(index)),
          );
        },
      )
    );
  }
}

class _HomePageBody extends StatelessWidget {
  final int currentPageIndex;

  _HomePageBody({super.key, required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    switch(currentPageIndex) {
      case 0:
        return _Home();
      case 1:
        return _Comics();
      case 2:
        return _Series();
      case 3:
        return _Movies();
      case 4:
        return _Search();
      default:
        return Placeholder();
    }
  }
}

class _Home extends StatelessWidget {
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 192,
          padding: const EdgeInsets.only(left: 32, right: 10, top: 16, bottom: 16),
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
          )
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 192),
                BlocBuilder<ComicVineSeriesListBloc, ComicVineSeriesListState>(
                  builder: (context, state) {
                    if(state is LoadedComicVineSeriesListState) {
                      return CardSlider(
                        hasButton: true, 
                        title: "Séries populaires",
                        cardList: state.seriesList.map((e) => CardTemplate(imagePath: e.image?.smallUrl??'', description: e.name??'')).toList(),  
                      );
                    }
                    else if(state is ErrorComicVineSeriesListState) {
                      return Text(state.message);
                    }
                    else {
                      return const CircularProgressIndicator();
                    }
                  }
                ),
                const SizedBox(height: 16),
                BlocBuilder<ComicVineIssuesBloc, ComicVineIssuesState>(
                  builder: (context, state) {
                    if(state is LoadedComicVineIssuesState) {
                      return CardSlider(
                        hasButton: true, 
                        title: "Comics populaires",
                        cardList: state.issues.map((e) => CardTemplate(imagePath: e.image?.smallUrl??'', description: '${e.volume?.name??""} ${e.issueNumber==null?"":"#${e.issueNumber}"} ${e.name==null?"":"- ${e.name}"}')).toList(),  
                      );
                    }
                    else if(state is ErrorComicVineIssuesState) {
                      return Text(state.message);
                    }
                    else {
                      return const CircularProgressIndicator();
                    }
                  }
                ),
                const SizedBox(height: 16),
                BlocBuilder<ComicVineMoviesBloc, ComicVineMoviesState>(
                  builder: (context, state) {
                    if(state is LoadedComicVineMoviesState) {
                      return CardSlider(
                        hasButton: true, 
                        title: "Films populaires",
                        cardList: state.movies.map((e) => CardTemplate(imagePath: e.image?.smallUrl??'', description: e.name??'')).toList(),  
                      );
                    }
                    else if(state is ErrorComicVineMoviesState) {
                      return Text(state.message);
                    }
                    else {
                      return const CircularProgressIndicator();
                    }
                  }
                ),
                const SizedBox(height: 16)
              ],
            )
          )
        )
      ],
    );
  }
}

class _Comics extends StatelessWidget {
  const _Comics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Series extends StatelessWidget {
  const _Series({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Movies extends StatelessWidget {
  const _Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Search extends StatelessWidget {
  const _Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}