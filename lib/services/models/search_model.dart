// To parse this JSON data, do
//
//     final getsearchmodel = getsearchmodelFromJson(jsonString);

import 'dart:convert';

Getsearchmodel getsearchmodelFromJson(String str) =>
    Getsearchmodel.fromJson(json.decode(str));

String getsearchmodelToJson(Getsearchmodel data) =>
    json.encode(data.toJson());

class Getsearchmodel {
  Characters? characters;

  Getsearchmodel({this.characters});

  factory Getsearchmodel.fromJson(Map<String, dynamic> json) =>
      Getsearchmodel(
        characters: json["characters"] == null
            ? null
            : Characters.fromJson(json["characters"]),
      );

  Map<String, dynamic> toJson() => {
    "characters": characters?.toJson(),
  };
}

class Characters {
  List<Result>? results;

  Characters({this.results});

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    results: json["results"] == null
        ? []
        : List<Result>.from(
        json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results":
    results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? id;
  String? name;
  String? gender;   // ✅ changed to String
  String? species;  // ✅ changed to String
  String? status;   // ✅ changed to String
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
    gender: json["gender"],     // ✅ direct String
    species: json["species"],   // ✅ direct String
    status: json["status"],     // ✅ direct String
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
