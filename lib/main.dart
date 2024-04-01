import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'utils/appcolors.dart';
import 'page/homepage.dart';
import 'page/issuedetails.dart';
import 'page/moviedetails.dart';
import 'page/seriedetails.dart';
import 'page/persondetails.dart';
import 'page/characterdetails.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(title: 'Flutter Demo Home Page');
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'issue/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return IssueDetailsPage(id: int.parse(id!));
          },
        ),
        GoRoute(
          path: 'series/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return SerieDetailsPage(id: int.parse(id!));
          },
        ),
        GoRoute(
          path: 'movie/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return MovieDetailsPage(id: int.parse(id!));
          },
        ),
        GoRoute(
          path: 'person/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return PersonDetailsPage(id: int.parse(id!));
          },
        ),
        GoRoute(
          path: 'character/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return CharacterDetailsPage(id: int.parse(id!));
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.screenBackgroundColor, // Set the background color
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
