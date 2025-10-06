import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skincare_task/services/api_services.dart';
import 'package:skincare_task/services/models/test_ep_models.dart';
import 'package:skincare_task/utilities/widgets/listview/product_collections.dart';
// import 'package:skincare_task/utilities/widgets/listview/products.dart';

class test_graphql extends StatelessWidget {
  static const String Route = "test_graphql";
  const test_graphql({super.key, this.subject, this.model});
  final String? subject;
  final Model? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: APIServices.getEpisodes,
          variables: {'page': 3},
        ),

        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return CircularProgressIndicator();
          }
          if (result.hasException || result.data == null) {
            return Text(" OOps something went wrong");
          }
          final data = GetEpisodeModel2.fromJson(result.data!);
          return Center(
            child: Column(
              children: [
                Text("${data.episodes?.results?[0].episode}"),
                Text("${model?.subject}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
