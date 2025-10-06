// To parse this JSON data, do
//
//     final characterCardModel = characterCardModelFromJson(jsonString);

import 'dart:convert';

CharacterCardModel characterCardModelFromJson(String str) =>
    CharacterCardModel.fromJson(json.decode(str));

String characterCardModelToJson(CharacterCardModel data) =>
    json.encode(data.toJson());

class CharacterCardModel {
  String? id;
  String? name;
  String? gender;
  String? species;
  String? status;
  String? image;

  CharacterCardModel({
    this.id,
    this.name,
    this.gender,
    this.species,
    this.status,
    this.image,
  });

  factory CharacterCardModel.fromJson(Map<String, dynamic> json) =>
      CharacterCardModel(
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
