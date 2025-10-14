// To parse this JSON data, do
//
//     final characterDetailModel = characterDetailModelFromJson(jsonString);

import 'dart:convert';

CharacterListModel characterDetailModelFromJson(String str) =>
    CharacterListModel.fromJson(json.decode(str));

String characterDetailModelToJson(CharacterListModel data) =>
    json.encode(data.toJson());

class CharacterListModel {
  String? id;
  String? name;
  String? gender;
  String? image;
  String? status;
  String? species;
  Origin? origin;
  Location? location;
  DateTime? created;
  List<Episode>? episode;

  CharacterListModel({
    this.id,
    this.name,
    this.gender,
    this.image,
    this.status,
    this.species,
    this.origin,
    this.location,
    this.created,
    this.episode,
  });

  factory CharacterListModel.fromJson(
    Map<String, dynamic> json,
  ) => CharacterListModel(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    image: json["image"],
    status: json["status"],
    species: json["species"],
    origin: json["origin"] == null ? null : Origin.fromJson(json["origin"]),
    location: json["location"] == null
        ? null
        : Location.fromJson(json["location"]),
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    episode: json["episode"] == null
        ? []
        : List<Episode>.from(json["episode"]!.map((x) => Episode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "image": image,
    "status": status,
    "species": species,
    "origin": origin?.toJson(),
    "location": location?.toJson(),
    "created": created?.toIso8601String(),
    "episode": episode == null
        ? []
        : List<dynamic>.from(episode!.map((x) => x.toJson())),
  };
}

class Episode {
  String? id;
  String? name;
  String? airDate;

  Episode({this.id, this.name, this.airDate});

  factory Episode.fromJson(Map<String, dynamic> json) =>
      Episode(id: json["id"], name: json["name"], airDate: json["air_date"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "air_date": airDate,
  };
}

class Location {
  String? name;
  String? type;
  String? dimension;

  Location({this.name, this.type, this.dimension});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    type: json["type"],
    dimension: json["dimension"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "dimension": dimension,
  };
}

class Origin {
  String? name;
  dynamic dimension;

  Origin({this.name, this.dimension});

  factory Origin.fromJson(Map<String, dynamic> json) =>
      Origin(name: json["name"], dimension: json["dimension"]);

  Map<String, dynamic> toJson() => {"name": name, "dimension": dimension};
}
