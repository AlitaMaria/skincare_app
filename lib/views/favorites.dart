import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:skincare_task/utilities/widgets/listview/products.dart';
import '../state_management/characterlist/characterlist.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skincare_task/utilities/utilities.dart';

class FavoritesNew extends StatelessWidget {
  static String route = '/favoritesNew';
  // final List<String> favoriteIds;

 const FavoritesNew({super.key,required Charactermodel? Charactermodel});
  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<CharacterListing>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorites"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          final favoriteIds = cardData.favorites;
          final results = cardData.characterListModel?.characters?.results ?? [];

          // Filter only liked characters
          final favoriteCharacters = results
              .where((char) => favoriteIds.contains(char.id))
              .toList();

          if (favoriteCharacters.isEmpty) {
            return const Center(child: Text("No favorites added yet ❤️"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2.4 / 4,
            ),
            itemCount: favoriteCharacters.length,
            itemBuilder: (context, index) {
              final character = favoriteCharacters[index];
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
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          // cardData.toggleFavorite(character.id!);
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
          );
        },
      ),
    );
  }
}
