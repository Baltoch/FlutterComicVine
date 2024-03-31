import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'utils/api/comicvine_model.dart';
import 'utils/api/comicvine_api.dart';
import 'utils/bloc/episode.dart';
import 'utils/appcolors.dart';
import 'widget/title.dart';
import 'widget/tabs.dart';
import 'widget/episode.dart';
import 'page/homepage.dart';

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
            return const Placeholder();
          },
        ),
        GoRoute(
          path: 'series/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return const Placeholder();
          },
        ),
        GoRoute(
          path: 'movie/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return const Placeholder();
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