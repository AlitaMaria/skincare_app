import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:skincare_task/services/models/episode_characters.dart';
import 'package:skincare_task/state_management/episode_characters/ep_characters.dart';


class EpisodeCharacters extends StatefulWidget {
  static const String route = "/EpisodeCharcters";

  final String? id;
  final EpisodeCharactersModel? episodeCharacterModel;

  EpisodeCharacters({super.key, this.id, this.episodeCharacterModel});

  @override
  State<EpisodeCharacters> createState() => _EpisodeCharactersState();
}

class _EpisodeCharactersState extends State<EpisodeCharacters> {
  late EpisodeCharactersMob epCharacters;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      epCharacters = Provider.of<EpisodeCharactersMob>(context, listen: false);
      await epCharacters.getEpCharacters(context, id: widget.id!);
    });
  }

  @override
  Widget build(BuildContext context) {

    epCharacters = Provider.of<EpisodeCharactersMob>(context, listen: false);
print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Episode Characters"),
      ),
      body: Observer(
        builder: (_) {
          if (epCharacters.isLoading) {
            return CircularProgressIndicator();
          }
          if (epCharacters.hasException) {

            return Text("Something went wrong:");
          }
          final characters=epCharacters.episodeCharactersModel?.episode?.characters??[] ;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              if(index ==0)
              print("imgae: ${character.image}");
              return Container(
                // color: Colors.blue,
                child: ListTile(

                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                   character.image
                          ?? '',

                    ),
                  ),
                  title: Text(character.name ?? "No Name"),
                  trailing: Text("${character.gender?? "UNKNOWN"}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

