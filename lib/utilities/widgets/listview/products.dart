import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skincare_task/services/api_services.dart';
import 'package:skincare_task/services/models/character_card_model.dart';

import 'package:skincare_task/utilities/utilities.dart';
import 'package:skincare_task/views/detailed_screen.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: APIServices.getCharacters,
        variables: {"page": 3},
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return const CircularProgressIndicator();
        }

        if (result.hasException ||
            result.data?['characters']?['results'] == null ||
            result.data!['characters']['results'].isEmpty) {
          return Text('No characters found');
        }
        final results = result.data!['characters']['results'];
        return SizedBox(
          height: 390,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: results.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              if (index == 0) print("charcter: ${jsonEncode(results[index])}");
              final character = CharacterCardModel.fromJson(results[index]);
              return GestureDetector(
                onTap: () {
                  // final param = {'title': "hii"};
                  // final testModel = TestModel(
                  //   title: "title",
                  //   subTitle: "subTitle",
                  // );
                  final characterId = character.id;
                  print(characterId);
                  context.pushNamed(
                    CharacterDetailScreen.route,
                    // extra: characterId,
                    queryParameters: {'id': characterId},
                    //   'name': character['name'],
                    //   'image': character['image'],
                    //   'status': character['status'],
                    //   'gender': character['gender'],
                    //   'species': character['species'],
                    // },
                    // GraphqlTestView.route,
                    //  queryParameters: param,
                    // extra: testModel,
                  );
                },
                child: Container(
                  width: 250,
                  height: 330,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowcolor, // Shadow color
                        blurRadius: 10, // Softness of shadow
                        spreadRadius: 2, // How far it spreads
                        offset: const Offset(0, 4), // Position (x, y)
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(48),
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),

                        child: CachedNetworkImage(
                          height: 246,
                          width: 265,

                          imageUrl: character.image ?? '',

                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 40),
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 14,

                        child: CircleAvatar(
                          backgroundColor: AppColors.heartbuttoncolor.withAlpha(
                            20,
                          ),
                          child: SvgPicture.asset("assets/icons/Vector.svg"),
                        ),
                      ),
                      // Padding(padding: EdgeInsetsGeometry.all(20)),
                      Positioned(
                        top: 215,
                        child: Container(
                          height: 160,
                          width: 250,
                          // width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name ?? '',
                                style: Styles.boldtextsTYLE(fontsize: 18),
                              ),
                              // const SizedBox(height: 6),
                              Text(
                                character.species ?? '',
                                style: Styles.boldtextsTYLE(fontsize: 10),
                              ),
                              // const SizedBox(height: 6),
                              Text(
                                character.gender ?? '',
                                style: Styles.getsmalltext(
                                  fontsize: 14,
                                  underline: false,
                                ),
                              ),
                              // SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    character.id ?? '',
                                    style: Styles.boldtextsTYLE(fontsize: 17),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: AppColors.buttoncolor,
                                    foregroundColor: AppColors.background,
                                    child: SvgPicture.asset(
                                      "assets/icons/bag-2.svg",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsetsGeometry.all(5)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Charactermodel {}

class TestModel {
  final String title;
  final String subTitle;

  TestModel({required this.title, required this.subTitle});
}
