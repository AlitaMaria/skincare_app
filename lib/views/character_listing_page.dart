import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skincare_task/views/favorites.dart';
import '../state_management/characterlist/characterlist.dart';
import 'package:skincare_task/utilities/utilities.dart';

import 'favoritesNew.dart';

class CharacterListingPage extends StatefulWidget {
  final int page;

  const CharacterListingPage({super.key, this.page = 1});

  static String route = 'CharacterListingPage';

  @override
  State<CharacterListingPage> createState() => _CharacterListingPageState();
}

class _CharacterListingPageState extends State<CharacterListingPage> {
  late CharacterListing cardData;
  List likedCharacters = []; // store character IDs (or indexes)

  @override
  void initState() {
    super.initState();
    cardData = Provider.of<CharacterListing>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await cardData.card(context, currentPage: widget.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    cardData = Provider.of<CharacterListing>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Listing"),
        scrolledUnderElevation: 0,
        centerTitle: true,

        ),

      body: Observer(
        builder: (_) {
          if (cardData.isTapped) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cardData.hasException ||
              cardData.characterListModel?.characters?.results == null ||
              cardData.characterListModel!.characters!.results!.isEmpty) {
            return const Center(child: Text('No characters found'));
          }

          final results = cardData.characterListModel!.characters!.results!;
          final pageInfo = cardData.characterListModel!.characters!.info!;

          return Column(
            children: [
              // Pagination Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: pageInfo.prev != null
                        ? () {
                            cardData.setPage(cardData.currentPage - 1);
                             cardData.card(context);


                          }
                        : null,
                    child: Text(
                      "Previous",
                      style: Styles.getsmalltext(
                        fontsize: 13,
                        color: AppColors.buttoncolor,
                        underline: true,
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed:  () {

                            context.pushNamed(
                              Favorites.route,
                              extra: cardData.wishlistItems,
                            );
                          },


                    child: Text(
                      "Favorites",
                      style: Styles.getsmalltext(
                        fontsize: 13,
                        color: AppColors.buttoncolor,
                        underline: true,
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: pageInfo.next != null
                        ? () {
                            cardData.setPage(cardData.currentPage + 1);
                            // cardData.refreshcounter;
                              cardData.card(context);
                            // cardData.wishlistItems;
                          }
                        : null,
                    child: Text(
                      "Next",
                      style: Styles.getsmalltext(
                        fontsize: 13,
                        color: AppColors.buttoncolor,
                        underline: true,
                      ),
                    ),
                  ),
                ],
              ),

              // Character Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2.4 / 4,
                  ),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final character = results[index];


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
                          // Character Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: character.image ?? '',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),

                          // Favorite Button
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Observer(
                              builder:(_)=> IconButton(
                                icon: Icon(
                                  cardData.favorites.contains(character.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: cardData.favorites.contains(character.id)
                                      ? Colors.red
                                      : Colors.blue,
                                ),
                                onPressed: () {
                                  cardData.toggleFavorite(character.id!, character);
                                  // cardData.refreshPage();
                                  // cardData.refreshCounter++;

                                    // cardData.favorites;
                                  // print(cardData.favorites);
                                  // print(jsonEncode(cardData.wishlistItems));
                                },
                              ),
                            ),
                          ),

                          // Character Info
                          Positioned(
                            top: 200,
                            left: 8,
                            right: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  character.name ?? '',
                                  style: Styles.boldtextsTYLE(fontsize: 16),
                                ),
                                Text(
                                  character.species ?? '',
                                  style: Styles.getsmalltext(
                                    fontsize: 12,
                                    color: AppColors.textcolor,
                                    underline: false,
                                  ),
                                ),
                                Text(
                                  character.gender ?? '',
                                  style: Styles.getsmalltext(
                                    fontsize: 12,
                                    color: AppColors.textcolor,
                                    underline: false,
                                  ),
                                ),
                                Text(
                                  character.id ?? '',
                                  style: Styles.boldtextsTYLE(fontsize: 17),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
