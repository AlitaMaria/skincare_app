import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skincare_task/services/api_services.dart';
import 'package:skincare_task/services/models/get_character_details.dart';
import 'package:skincare_task/state_management/character/character.dart';
import 'package:skincare_task/state_management/my_state/detailcharacter.dart';
import 'package:skincare_task/utilities/app_colors.dart';
import 'package:skincare_task/utilities/utilities.dart';

import 'episode_characters.dart';

class CharacterDetailScreen extends StatefulWidget {
  final String? id;
  // final String? name;
  // final String? image;
  // final String? gender;
  // final String? species;
  // final String? status;

  // final List<Result> allCharacters;
  // final GetCharacterDetails? getCharacterDetails;
  static const String route = "/DetailsScreen";

  const CharacterDetailScreen({
    super.key,
    this.id,
    // this.name,
    // this.image,
    // this.gender,
    // this.species,
    // this.status,
    // this.getCharacterDetails,
    // required this.allCharacters,
  });


  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  late CharacterData characterData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      if(widget.id != null) {
        characterData = Provider.of<CharacterData>(context, listen: false);
        await characterData.getCharacterById(context, id: widget.id!);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    characterData = Provider.of<CharacterData>(context, listen: false);
    // final detailCharacter = Provider.of<DetailCharacter>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Character Details"),
      ),
      body: Observer(
        builder: (_) {

          if(characterData.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if(characterData.hasException || characterData.characterDetailModel == null) {
            return const Center(child: Text('Character not found'));
          }

          final character = characterData.characterDetailModel!;
          final episodes = character.episode;

          List selectedepisode = [];
              List category = [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      character.image ?? '',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // TextButton(onPressed: (){
                //   detailCharacter.tapingId(!isTapped);
                //
                // }, child: isTapped ? const CircularProgressIndicator() :
                // Text("character")
                //
                // ),
                Text(
                  "Name: ${character.name ?? 'Unknown'}",
                  style: Styles.boldtextsTYLE(fontsize: 20),
                ),
                Text(
                  "Species: ${character.species ?? 'Unknown'}",
                  style: Styles.boldtextsTYLE(fontsize: 15),
                ),
                Text("Gender: ${character.gender ?? 'Unknown'}"),
                Text("Status: ${character.status ?? 'Unknown'}"),
                Wrap(
                  children: [
                    Text("Origin: ${character.origin?.name ?? 'Unknown'},"),
                    Text(
                      "Dimension: ${character.origin?.dimension ?? 'Unknown'}",
                    ),
                  ],
                ),
                Text(
                  "Location(Last seen): ${character.location?.name ?? 'Unknown'},${character.location?.dimension ?? 'Unknown'},${character.location?.type ?? 'Unknown'}",
                ),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: episodes!.map((Episode) {
                    final isSelected = selectedepisode.contains(category);


                    return ChoiceChip(
                      label: Text("#${Episode.id}- ${Episode.name}"),
                      selected: isSelected,

                      onSelected: (_) {
                        context.pushNamed(EpisodeCharacters.route,
                            queryParameters: {'id':{Episode.id}});
                        print("${Episode.id}");
                        // setState(() {
                        //   if (isSelected) {
                        //     // context.pushNamed(
                        //     //     EpisodeCharacters.route,
                        //     //   queryParameters: {'id':episodeId}
                        //     // );
                        //     selectedepisode.add(category);
                        //   } else {
                        //     selectedepisode.remove(category);
                        //   }
                        // });
                      },

                      labelStyle: TextStyle(
                        color: isSelected
                            ? const Color.fromARGB(255, 174, 36, 36)
                            : AppColors.textcolor,
                        fontSize: 16,
                      ),
                      // backgroundColor: AppColors.buttoncolor,
                      // showCheckmark: true,
                      selectedColor: const Color.fromARGB(
                        255,
                        187,
                        41,
                        41,
                      ), // soft green
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );

          // final isTapped = detailCharacter.istapped;
          // return Query(
          //   options: QueryOptions(
          //     document: APIServices.getCharacterDetail,
          //     variables: {"id": widget.id},
          //   ),
          //   builder: (result, {fetchMore, refetch}) {
          //     if (result.isLoading) {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //
          //     if (result.hasException || result.data?['character'] == null) {
          //       return const Center(child: Text('Character not found'));
          //     }
          //
          //     // Parse the character JSON
          //     final characterData = CharacterDetailModel.fromJson(
          //       result.data!['character'],
          //     );
          //     final episodes = characterData.episode;
          //     List selectedepisode = [];
          //     List category = [];
          //
          //     // if (characterData == null) {
          //     //   return const Center(child: Text('Character data is null'));
          //     // }
          //
          //     return SingleChildScrollView(
          //       padding: const EdgeInsets.all(16),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Center(
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(100),
          //               child: Image.network(
          //                 characterData.image ?? '',
          //                 width: 200,
          //                 height: 200,
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(height: 16),
          //           TextButton(onPressed: (){
          //             detailCharacter.tapingId(!isTapped);
          //
          //           }, child: isTapped ? const CircularProgressIndicator() :
          //     Text("character")
          //
          //           ),
          //           Text(
          //             "Name: ${characterData.name ?? 'Unknown'}",
          //             style: Styles.boldtextsTYLE(fontsize: 20),
          //           ),
          //           Text(
          //             "Species: ${characterData.species ?? 'Unknown'}",
          //             style: Styles.boldtextsTYLE(fontsize: 15),
          //           ),
          //           Text("Gender: ${characterData.gender ?? 'Unknown'}"),
          //           Text("Status: ${characterData.status ?? 'Unknown'}"),
          //           Wrap(
          //             children: [
          //               Text("Origin: ${characterData.origin?.name ?? 'Unknown'},"),
          //               Text(
          //                 "Dimension: ${characterData.origin?.dimension ?? 'Unknown'}",
          //               ),
          //             ],
          //           ),
          //           Text(
          //             "Location(Last seen): ${characterData.location?.name ?? 'Unknown'},${characterData.location?.dimension ?? 'Unknown'},${characterData.location?.type ?? 'Unknown'}",
          //           ),
          //
          //           Wrap(
          //             spacing: 12,
          //             runSpacing: 12,
          //             children: episodes!.map((Episode) {
          //               final isSelected = selectedepisode.contains(category);
          //               return ChoiceChip(
          //                 label: Text("#${Episode.id}- ${Episode.name}"),
          //                 selected: isSelected,
          //                 onSelected: (selected) {
          //                   setState(() {
          //                     if (selected) {
          //                       selectedepisode.add(category);
          //                     } else {
          //                       selectedepisode.remove(category);
          //                     }
          //                   });
          //                 },
          //
          //                 labelStyle: TextStyle(
          //                   color: isSelected
          //                       ? const Color.fromARGB(255, 174, 36, 36)
          //                       : AppColors.textcolor,
          //                   fontSize: 16,
          //                 ),
          //                 // backgroundColor: AppColors.buttoncolor,
          //                 // showCheckmark: true,
          //                 selectedColor: const Color.fromARGB(
          //                   255,
          //                   187,
          //                   41,
          //                   41,
          //                 ), // soft green
          //                 padding: const EdgeInsets.symmetric(
          //                   horizontal: 18,
          //                   vertical: 10,
          //                 ),
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(10),
          //                 ),
          //               );
          //             }).toList(),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // );
        }
      ),
    );
  }
}
