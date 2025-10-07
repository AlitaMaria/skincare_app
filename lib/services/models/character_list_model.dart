// To parse this JSON data, do
//
//     final characterListModel = characterListModelFromJson(jsonString);

import 'dart:convert';

CharacterListModel characterListModelFromJson(String str) => CharacterListModel.fromJson(json.decode(str));

String characterListModelToJson(CharacterListModel data) => json.encode(data.toJson());

class CharacterListModel {
  Characters? characters;

  CharacterListModel({
    this.characters,
  });

  factory CharacterListModel.fromJson(Map<String, dynamic> json) => CharacterListModel(
    characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
  );

  Map<String, dynamic> toJson() => {
    "characters": characters?.toJson(),
  };

  operator [](int other) {}
}

class Characters {
  List<Result>? results;

  Characters({
    this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? id;
  String? name;
  String? gender;
  String? species;
  String? status;
  String? image;

  Result({
    this.id,
    this.name,
    this.gender,
    this.species,
    this.status,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    species: json["species"],
    status: json["status"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "species": species,
    "status": status,
    "image": image,
  };
}

