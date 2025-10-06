import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skincare_task/services/routes.dart' as routes;

import 'services/api_services.dart';

void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
