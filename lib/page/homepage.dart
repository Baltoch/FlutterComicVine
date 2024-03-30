import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        BlocProvider<ComicVineIssuesBloc>(create:(context) => ComicVineIssuesBloc()..add(LoadComicVineIssuesEvent())),
        BlocProvider<ComicVineMoviesBloc>(create:(context) => ComicVineMoviesBloc()..add(LoadComicVineMoviesEvent())),
        BlocProvider<ComicVineSeriesListBloc>(create:(context) => ComicVineSeriesListBloc()..add(LoadComicVineSeriesListEvent())),
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
    return const Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        children: <Widget>[
          Episode(content: "Episode #01", title: "Pilot", date: "  06 Mars 2024", imageURL: "https://cdn-s-www.jde.fr/images/8AB636F4-1886-4690-BEB6-0DDD5E97E98B/JDE_detail_raw/photo-20th-century-studios-1652450949.jpg"),
        ],
      ),
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