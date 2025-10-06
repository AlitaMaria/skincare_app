import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skincare_task/services/api_services.dart';
import 'package:skincare_task/services/models/get_episodes_model';
import 'package:skincare_task/utilities/widgets/listview/products.dart';

class GraphqlTestView extends StatelessWidget {
  static const String route = "graphql_test";
  const GraphqlTestView({super.key, this.title, this.testModel});
  final String? title;
  final TestModel? testModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: APIServices.getEpisodes,
          variables: {"page": 3},
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const CircularProgressIndicator();
          }

          if (result.hasException || result.data == null) {
            return Text('No episodes found');
          }

          final episodeModel = GetEpisodeModel.fromJson(
            result.data!['episodes'],
          );

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (episodeModel.info?.count != null)
                  Text("${episodeModel.info!.count}"),
                Text("modelTitle: ${testModel?.title}"),
                Text("modelSubTitle: ${testModel?.subTitle}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
