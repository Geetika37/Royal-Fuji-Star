// To parse this JSON data, do
//
//     final carouselSliderModel = carouselSliderModelFromJson(jsonString);

import 'dart:convert';

CarouselSliderModel carouselSliderModelFromJson(String str) => CarouselSliderModel.fromJson(json.decode(str));

String carouselSliderModelToJson(CarouselSliderModel data) => json.encode(data.toJson());

class CarouselSliderModel {
    bool success;
    String message;
    List<Datum> data;

    CarouselSliderModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory CarouselSliderModel.fromJson(Map<String, dynamic> json) => CarouselSliderModel(
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
    int id;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    String locale;
    List<Image> images;

    Datum({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.locale,
        required this.images,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": locale,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Image {
    int id;
    String url;
    Formats formats;

    Image({
        required this.id,
        required this.url,
        required this.formats,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        formats: Formats.fromJson(json["formats"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "formats": formats.toJson(),
    };
}

class Formats {
    Thumbnail thumbnail;
    Thumbnail? large;
    Thumbnail? small;
    Thumbnail? medium;

    Formats({
        required this.thumbnail,
        this.large,
        this.small,
        this.medium,
    });

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "large": large?.toJson(),
        "small": small?.toJson(),
        "medium": medium?.toJson(),
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
