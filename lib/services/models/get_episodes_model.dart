// To parse this JSON data, do
//
//     final getEpisodeModel = getEpisodeModelFromJson(jsonString);

import 'dart:convert';

GetEpisodeModel getEpisodeModelFromJson(String str) => GetEpisodeModel.fromJson(json.decode(str));

String getEpisodeModelToJson(GetEpisodeModel data) => json.encode(data.toJson());

class GetEpisodeModel {
    Info? info;
    List<Result>? results;

    GetEpisodeModel({
        this.info,
        this.results,
    });

    factory GetEpisodeModel.fromJson(Map<String, dynamic> json) => GetEpisodeModel(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

  get episodes => null;

    Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Info {
    int? count;
    int? pages;

    Info({
        this.count,
        this.pages,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
    };
}

class Result {
    String? id;
    String? name;
    String? airDate;
    String? episode;
    List<Character>? characters;

    Result({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"] == null ? [] : List<Character>.from(json["characters"]!.map((x) => Character.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": characters == null ? [] : List<dynamic>.from(characters!.map((x) => x.toJson())),
    };
}

class Character {
    String? id;
    String? name;
    String? image;

    Character({
        this.id,
        this.name,
        this.image,
    });

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
