import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../state_management/characterlist/characterlist.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skincare_task/utilities/utilities.dart';

import '../state_management/my_state/detailcharacter.dart';
import '../utilities/widgets/listview/products.dart';

class Favorites extends StatelessWidget {
  static String route = 'favorites';
  final Charactermodel? model;

  const Favorites({super.key,required this.model});
  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<CharacterListing>(context);
    // final cardData2 = Provider.of<DetailCharacter>(context);
    return Observer(
      builder: (_)=>
        Scaffold(
          appBar: AppBar(
            title: const Text("My Favorites"),
            centerTitle: true,
          ),
          body: Observer(
            builder: (_) {
              final favoriteIds = cardData.wishlistItems;
              final results = cardData.characterListModel?.characters?.results ?? [];

              // Filter only liked characters
              // final favoriteCharacters = results
              //     .where((char) => favoriteIds.contains(char.id))
              //     .toList();

              if (favoriteIds.isEmpty) {
                return const Center(child: Text("No favorites added yet ❤️"));
              }else{

                print((favoriteIds));


                return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2.4 / 4,
                  ),
                  itemCount: favoriteIds.length,
                  itemBuilder: (context, index) {
                    final character = favoriteIds[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.background,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowcolor,
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: CachedNetworkImage(
                              imageUrl: character.image ?? '',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(cardData.favorites.contains(character.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                                color: cardData.favorites.contains(character.id)
                                    ? Colors.red
                                    : Colors.blue,),
                              onPressed: () {
                                cardData.toggleFavorite(character.id!, character);
                                // cardData.card((context));

                              },
                            ),
                          ),
                          Positioned(
                            top: 200,
                            left: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(character.name ?? '', style: Styles.boldtextsTYLE(fontsize: 16)),
                                Text(character.gender ?? '', style: Styles.getsmalltext(fontsize: 12,color: AppColors.textcolor,underline: false)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );}
            },
          ),
        )

    );
  }
}
