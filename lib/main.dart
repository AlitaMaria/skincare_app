import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skincare_task/services/routes.dart' as routes;
import 'package:skincare_task/state_management/Search/search_content.dart';
import 'package:skincare_task/state_management/character/character.dart';
import 'package:skincare_task/state_management/characterlist/characterlist.dart';
import 'package:skincare_task/state_management/episode_characters/ep_characters.dart';
import 'package:skincare_task/state_management/my_state/detailcharacter.dart';

import 'services/api_services.dart';

void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider<CharacterData>(create: (_) => CharacterData()),
        Provider<DetailCharacter>(create: (_) => DetailCharacter()),
        Provider<CharacterListing>(
          create: (_) => CharacterListing(),
        ),
        Provider<EpisodeCharactersMob>(create: (_) => EpisodeCharactersMob()),
        Provider<SearchContent>(create: (_) => SearchContent()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Link link;

    final HttpLink httpLink = HttpLink(
      APIServices.baseUrl,
      defaultHeaders: APIServices.headers,
    );

    link = httpLink;

    ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        queryRequestTimeout: const Duration(seconds: 40),
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routes.router,
      ),
    );
  }
}
