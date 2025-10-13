// To parse this JSON data, do
//
//     final episodeCharacters = episodeCharactersFromJson(jsonString);

import 'dart:convert';

EpisodeCharactersModel episodeCharactersFromJson(String str) => EpisodeCharactersModel.fromJson(json.decode(str));

String episodeCharactersToJson(EpisodeCharactersModel data) => json.encode(data.toJson());

class EpisodeCharactersModel {
  Episode? episode;

  EpisodeCharactersModel({
    this.episode,
  });

  factory EpisodeCharactersModel.fromJson(Map<String, dynamic> json) => EpisodeCharactersModel(
    episode: json["episode"] == null ? null : Episode.fromJson(json["episode"]),
  );

  Map<String, dynamic> toJson() => {
    "episode": episode?.toJson(),
  };
}

class Episode {
  String? id;
  String? name;
  List<Character>? characters;

  Episode({
    this.id,
    this.name,
    this.characters,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    id: json["id"],
    name: json["name"],
    characters: json["characters"] == null ? [] : List<Character>.from(json["characters"]!.map((x) => Character.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "characters": characters == null ? [] : List<dynamic>.from(characters!.map((x) => x.toJson())),
  };
}

class Character {
  String? name;
  String? gender;
  String? image;

  Character({
    this.name,
    this.gender,
    this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    name: json["name"],
    gender: json["gender"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "image": image,
  };
}


