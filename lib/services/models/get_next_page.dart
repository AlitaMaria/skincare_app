// To parse this JSON data, do
//
//     final getNextPage = getNextPageFromJson(jsonString);

import 'dart:convert';

GetNextPage getNextPageFromJson(String str) => GetNextPage.fromJson(json.decode(str));

String getNextPageToJson(GetNextPage data) => json.encode(data.toJson());

class GetNextPage {
  Info? info;
  List<Result>? results;

  GetNextPage({
    this.info,
    this.results,
  });

  factory GetNextPage.fromJson(Map<String, dynamic> json) => GetNextPage(
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info?.toJson(),
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Info {
  int? count;
  int? pages;
  dynamic next;
  int? prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
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
