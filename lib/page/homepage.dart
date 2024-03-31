import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercomicvine/svg/app_vectorial_images.dart';
import 'package:fluttercomicvine/widget/card.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentPageIndexCubit()),
        BlocProvider<ComicVineIssuesBloc>(create:(context) => ComicVineIssuesBloc()..add(LoadComicVineIssuesEvent(5))),
        BlocProvider<ComicVineMoviesBloc>(create:(context) => ComicVineMoviesBloc()..add(LoadComicVineMoviesEvent(5))),
        BlocProvider<ComicVineSeriesListBloc>(create:(context) => ComicVineSeriesListBloc()..add(LoadComicVineSeriesListEvent(5))),
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
                        onSeeMoreClick: () => BlocProvider.of<CurrentPageIndexCubit>(context)..set(2),
                        hasButton: true, 
                        title: "Séries populaires",
                        cardList: state.seriesList.map((e) => CardTemplate(imagePath: e.image?.smallUrl??'', description: e.name??'', onClick: (e) {})).toList(),  
                      );
                    }
                    else if(state is ErrorComicVineSeriesListState) {
                      return Text(state.message);
                    }
                    else if(state is LoadingComicVineSeriesListState) {
                      return const CardSliderSkeleton();
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
                        onSeeMoreClick: () => BlocProvider.of<CurrentPageIndexCubit>(context)..set(1),
                        hasButton: true, 
                        title: "Comics populaires",
                        cardList: state.issues.map((e) => CardTemplate(imagePath: e.image?.smallUrl??'', description: '${e.volume?.name??""} ${e.issueNumber==null?"":"#${e.issueNumber}"} ${e.name==null?"":"- ${e.name}"}', onClick: (e) {})).toList(),  
                      );
                    }
                    else if(state is ErrorComicVineIssuesState) {
                      return Text(state.message);
                    }
                    else if(state is LoadingComicVineIssuesState) {
                      return const CardSliderSkeleton();
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
                        onSeeMoreClick: () => BlocProvider.of<CurrentPageIndexCubit>(context)..set(3),
                        hasButton: true, 
                        title: "Films populaires",
                        cardList: state.movies.map((e) => CardTemplate(imagePath: e.image?.smallUrl??'', description: e.name??'', onClick: (e) {})).toList(),  
                      );
                    }
                    else if(state is ErrorComicVineMoviesState) {
                      return Text(state.message);
                    }
                    else if(state is LoadingComicVineMoviesState) {
                      return const CardSliderSkeleton();
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
    return BlocProvider<ComicVineIssuesBloc>(
      create: (context) => ComicVineIssuesBloc()..add(LoadComicVineIssuesEvent(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: const AppTitle(content: "Comics les plus populaires")
              ),
              BlocBuilder<ComicVineIssuesBloc, ComicVineIssuesState>(builder: (context, state) {
                  if(state is LoadedComicVineIssuesState) {
                    return Column(children: state.issues.asMap().entries.map((e) => Container(
                        margin: const EdgeInsets.only(top: 21),
                        child: Popular(
                          title: e.value.volume?.name??'', 
                          date: e.value.coverDate??'',
                          rank: '#${(e.key + 1).toString()}', 
                          imageURL: e.value.image?.smallUrl??'',
                          nomLivre: e.value.name,
                          numeroLivre: e.value.issueNumber,
                          onClick: (e) {},
                        )
                      )).toList()
                    );
                  }
                  else if(state is ErrorComicVineIssuesState) {
                    return Text(
                      state.message, 
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    );
                  }
                  else if(state is LoadingComicVineIssuesState) {
                    return Center(
                      child: Column(
                        children: List.generate(
                          30, 
                          (index) => Container(
                            margin: const EdgeInsets.only(top: 21),
                            child: const PopularSkeleton()
                          )
                        )
                      ),
                    );
                  }
                  else {
                    return const Placeholder();
                  }
                },
              ),
              const SizedBox(height: 21)
            ]
          ),
        ),
      ),
    );
  }
}

class _Series extends StatelessWidget {
  const _Series({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineSeriesListBloc>(
      create: (context) => ComicVineSeriesListBloc()..add(LoadComicVineSeriesListEvent(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: const AppTitle(content: "Séries les plus populaires")
              ),
              BlocBuilder<ComicVineSeriesListBloc, ComicVineSeriesListState>(builder: (context, state) {
                  if(state is LoadedComicVineSeriesListState) {
                    return Column(children: state.seriesList.asMap().entries.map((e) => Container(
                        margin: const EdgeInsets.only(top: 21),
                        child: Popular(
                          title: e.value.name??'', 
                          date: e.value.startYear??'',
                          rank: '#${(e.key + 1).toString()}', 
                          imageURL: e.value.image?.smallUrl??'',
                          nbEpisodes: e.value.countOfEpisodes.toString(),
                          edition: e.value.publisher?.name,
                          onClick: (e) {},
                        )
                      )).toList()
                    );
                  }
                  else if(state is ErrorComicVineSeriesListState) {
                    return Text(
                      state.message, 
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    );
                  }
                  else if(state is LoadingComicVineSeriesListState) {
                    return Center(
                      child: Column(
                        children: List.generate(
                          30, 
                          (index) => Container(
                            margin: const EdgeInsets.only(top: 21),
                            child: const PopularSkeleton()
                          )
                        )
                      ),
                    );
                  }
                  else {
                    return const Placeholder();
                  }
                },
              ),
              const SizedBox(height: 21)
            ]
          ),
        ),
      ),
    );
  }
}

class _Movies extends StatelessWidget {
  const _Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicVineMoviesBloc>(
      create: (context) => ComicVineMoviesBloc()..add(LoadComicVineMoviesEvent(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 34),
                child: const AppTitle(content: "Films les plus populaires")
              ),
              BlocBuilder<ComicVineMoviesBloc, ComicVineMoviesState>(builder: (context, state) {
                  if(state is LoadedComicVineMoviesState) {
                    return Column(children: state.movies.asMap().entries.map((e) => Container(
                        margin: const EdgeInsets.only(top: 21),
                        child: Popular(
                          title: e.value.name??'', 
                          date: e.value.dateAdded??'',
                          duree: e.value.runtime,
                          rank: '#${(e.key + 1).toString()}', 
                          imageURL: e.value.image?.smallUrl??'',
                          onClick: (e) {},
                        )
                      )).toList()
                    );
                  }
                  else if(state is ErrorComicVineMoviesState) {
                    return Text(
                      state.message, 
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    );
                  }
                  else if(state is LoadingComicVineMoviesState) {
                    return Center(
                      child: Column(
                        children: List.generate(
                          30, 
                          (index) => Container(
                            margin: const EdgeInsets.only(top: 21),
                            child: const PopularSkeleton()
                          )
                        )
                      ),
                    );
                  }
                  else {
                    return const Placeholder();
                  }
                },
              ),
              const SizedBox(height: 21)
            ]
          ),
        ),
      ),
    );
  }
}









class _Search extends StatelessWidget {
  const _Search({super.key});

 @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 570),
          child: AppSearchBar(),
        ),
        
        Center (
          
          child: Container(
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

                Padding (padding: EdgeInsets.only(top: 20) ,
                child: Container(
                  height: 125,
                  width: 325, 
                  decoration: BoxDecoration(
                    color: AppColors.bgSearch,
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 30, bottom: 30, right: 95),
                    child: Center(
                      child: Text(
                        "Saisissez une recherche pour trouver un comics, film, série ou personnage",
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ),
                ),),

                Positioned(
                  child: SvgPicture.asset(AppVectorialImages.astronaut),
                  height: 80,
                  top: 0, 
                  right: -10, 
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
