// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart' as DetailsScreen;
import 'package:go_router/go_router.dart';
// import 'package:skincare_task/services/models/test_ep_models.dart' hide Result;
import 'package:skincare_task/utilities/widgets/widgets.dart';
import 'package:skincare_task/views/category.dart';
import 'package:skincare_task/views/detailed_screen.dart';
import 'package:skincare_task/views/graphql_test_view.dart';
import 'package:skincare_task/views/mainscreen.dart';
import 'package:skincare_task/views/screen1.dart' show Screen1;
import 'package:skincare_task/views/test_grphql.dart';

// import 'package:skincare_task/views/screen1.dart';
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Screen1();
      },
      routes: [
        GoRoute(
          path: Category.route,
          name: Category.route,
          builder: (context, state) {
            return const Category();
          },
        ),
      ],
    ),
    GoRoute(
      path: Mainscreen.route,
      name: Mainscreen.route,
      builder: (context, state) {
        return const Mainscreen();
      },
      routes: [
        GoRoute(
          path: test_graphql.Route,
          name: test_graphql.Route,
          builder: (context, state) {
            final arg = state.uri.queryParameters;
            final extra = state.extra;

            return test_graphql(
              subject: arg["subject"],
              model: extra != null ? extra as Model : null,
            );
          },
        ),
        GoRoute(
          path: CharacterDetailScreen.route,
          name: CharacterDetailScreen.route,
          builder: (context, state) {
            // final extra = state.extra as GetCharacterDetails;

            final id = state.uri.queryParameters['id'];
            // final name = state.uri.queryParameters['name'];
            // final image = state.uri.queryParameters['image'];
            // final gender = state.uri.queryParameters['gender'];
            // final species = state.uri.queryParameters['species'];
            // final status = state.uri.queryParameters['status'];

            return CharacterDetailScreen(
              id: id,
              // name: name,
              // image: image,
              // gender: gender,
              // species: species,
              // status: status,
              // getCharacterDetails: extra,
            );
          },
        ),

        GoRoute(
          path: GraphqlTestView.route,
          name: GraphqlTestView.route,
          builder: (context, state) {
            final arg = state.uri.queryParameters;
            return GraphqlTestView(
              title: arg['title'],
              testModel: state.extra as TestModel,
            );
          },
        ),
      ],
    ),
  ],
);
