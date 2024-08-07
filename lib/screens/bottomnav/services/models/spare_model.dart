// To parse this JSON data, do
//
//     final spareResponse = spareResponseFromJson(jsonString);

import 'dart:convert';

SpareResponse spareResponseFromJson(String str) =>
    SpareResponse.fromJson(json.decode(str));

String spareResponseToJson(SpareResponse data) => json.encode(data.toJson());

class SpareResponse {
  bool success;
  String message;
  List<Datum> data;

  SpareResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SpareResponse.fromJson(Map<String, dynamic> json) => SpareResponse(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  BrandSpares brandSpares;

  Datum({
    required this.brandSpares,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        brandSpares: BrandSpares.fromJson(json["brandSpares"]),
      );

  Map<String, dynamic> toJson() => {
        "brandSpares": brandSpares.toJson(),
      };
}

class BrandSpares {
  String name;
  List<SpareList> spareList;

  BrandSpares({
    required this.name,
    required this.spareList,
  });

  factory BrandSpares.fromJson(Map<String, dynamic> json) => BrandSpares(
        name: json["name"],
        spareList: List<SpareList>.from(
            json["spareList"].map((x) => SpareList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "spareList": List<dynamic>.from(spareList.map((x) => x.toJson())),
      };
}

class SpareList {
  String name;
  int id;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String locale;
  List<SpareList>? localizations;
  Category category;
  Image? image;
  Category? brand;

  SpareList({
    required this.name,
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
    this.localizations,
    required this.category,
    this.image,
    this.brand,
  });

  factory SpareList.fromJson(Map<String, dynamic> json) => SpareList(
        name: json["name"],
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        localizations: json["localizations"] == null
            ? []
            : List<SpareList>.from(
                json["localizations"]!.map((x) => SpareList.fromJson(x))),
        category: Category.fromJson(json["category"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        brand: json["brand"] == null ? null : Category.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": locale,
        "localizations": localizations == null
            ? []
            : List<dynamic>.from(localizations!.map((x) => x.toJson())),
        "category": category.toJson(),
        "image": image?.toJson(),
        "brand": brand?.toJson(),
      };
}

class Category {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String locale;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": locale,
      };
}

class Image {
  int id;
  String url;
  Formats? formats;

  Image({
    required this.id,
    required this.url,
    required this.formats,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "formats": formats?.toJson(),
      };
}

class Formats {
  Thumbnail thumbnail;

  Formats({
    required this.thumbnail,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
      };
}

class Thumbnail {
  String ext;
  String url;
  String hash;
  String mime;
  String name;
  dynamic path;
  double size;
  int width;
  int height;
  int sizeInBytes;

  Thumbnail({
    required this.ext,
    required this.url,
    required this.hash,
    required this.mime,
    required this.name,
    required this.path,
    required this.size,
    required this.width,
    required this.height,
    required this.sizeInBytes,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"]?.toDouble(),
        width: json["width"],
        height: json["height"],
        sizeInBytes: json["sizeInBytes"],
      );

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
        "sizeInBytes": sizeInBytes,
      };
}
