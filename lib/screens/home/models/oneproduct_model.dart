// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  bool success;
  String message;
  Data data;

  Product({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? publishedAt;
  Locale? locale;
  // Category productCategory;
  Brochure? mainImage;
  List<Brochure>? gallery;
  Brochure? brochure;
  List<Component> components;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.publishedAt,
    this.locale,
    // required this.productCategory,
    required this.mainImage,
    required this.gallery,
    required this.brochure,
    required this.components,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        locale:
            json['locale'] == null ? null : localeValues.map[json["locale"]],
        // productCategory: Category.fromJson(json["productCategory"]),
        mainImage:json['mainImage'] == null ?null : Brochure.fromJson(json["mainImage"]) ,
        gallery:json['gallery'] == null?null: List<Brochure>.from(
            json["gallery"].map((x) => Brochure.fromJson(x))),
        brochure:json['brochure'] == null ? null: Brochure.fromJson(json["brochure"]),
        components: List<Component>.from(
            json["components"].map((x) => Component.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": localeValues.reverse[locale],
        // "productCategory": productCategory.toJson(),
        "mainImage": mainImage?.toJson(),
        "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "brochure": brochure?.toJson(),
        "components": List<dynamic>.from(components.map((x) => x.toJson())),
      };
}

class Brochure {
  int id;
  String url;
  Formats? formats;

  Brochure({
    required this.id,
    required this.url,
    required this.formats,
  });

  factory Brochure.fromJson(Map<String, dynamic> json) => Brochure(
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
  Thumbnail? large;
  Thumbnail? small;
  Thumbnail? medium;
  Thumbnail thumbnail;

  Formats({
    this.large,
    this.small,
    this.medium,
    required this.thumbnail,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        medium:
            json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large?.toJson(),
        "small": small?.toJson(),
        "medium": medium?.toJson(),
        "thumbnail": thumbnail.toJson(),
      };
}

class Thumbnail {
  Ext ext;
  String url;
  String hash;
  Mime mime;
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
        ext: extValues.map[json["ext"]]!,
        url: json["url"],
        hash: json["hash"],
        mime: mimeValues.map[json["mime"]]!,
        name: json["name"],
        path: json["path"],
        size: json["size"]?.toDouble(),
        width: json["width"],
        height: json["height"],
        sizeInBytes: json["sizeInBytes"],
      );

  Map<String, dynamic> toJson() => {
        "ext": extValues.reverse[ext],
        "url": url,
        "hash": hash,
        "mime": mimeValues.reverse[mime],
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
        "sizeInBytes": sizeInBytes,
      };
}

enum Ext { JPG }

final extValues = EnumValues({".jpg": Ext.JPG});

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({"image/jpeg": Mime.IMAGE_JPEG});

class Component {
  ComponentCollection componentCollection;

  Component({
    required this.componentCollection,
  });

  factory Component.fromJson(Map<String, dynamic> json) => Component(
        componentCollection:
            ComponentCollection.fromJson(json["componentCollection"]),
      );

  Map<String, dynamic> toJson() => {
        "componentCollection": componentCollection.toJson(),
      };
}

class ComponentCollection {
  String name;
  List<ComponentList> componentList;

  ComponentCollection({
    required this.name,
    required this.componentList,
  });

  factory ComponentCollection.fromJson(Map<String, dynamic> json) =>
      ComponentCollection(
        name: json["name"],
        componentList: List<ComponentList>.from(
            json["componentList"].map((x) => ComponentList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "componentList":
            List<dynamic>.from(componentList.map((x) => x.toJson())),
      };
}

class ComponentList {
  String name;
  int id;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  Locale locale;
  Category category;
  Brochure image;

  ComponentList({
    required this.name,
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
    required this.category,
    required this.image,
  });

  factory ComponentList.fromJson(Map<String, dynamic> json) => ComponentList(
        name: json["name"],
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: localeValues.map[json["locale"]]!,
        category: Category.fromJson(json["category"]),
        image: Brochure.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": localeValues.reverse[locale],
        "category": category.toJson(),
        "image": image.toJson(),
      };
}

class Category {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? publishedAt;
  Locale? locale;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
     this.publishedAt,
    required this.locale,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        locale:
            json['locale'] == null ? null : localeValues.map[json["locale"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": localeValues.reverse[locale],
      };
}

enum Locale { EN }

final localeValues = EnumValues({"en": Locale.EN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
