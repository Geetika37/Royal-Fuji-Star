// // To parse this JSON data, do
// //
// //     final carouselSliderModel = carouselSliderModelFromJson(jsonString);

// import 'dart:convert';

// CarouselSliderModel carouselSliderModelFromJson(String str) => CarouselSliderModel.fromJson(json.decode(str));

// String carouselSliderModelToJson(CarouselSliderModel data) => json.encode(data.toJson());

// class CarouselSliderModel {
//     bool success;
//     String message;
//     Data data;

//     CarouselSliderModel({
//         required this.success,
//         required this.message,
//         required this.data,
//     });

//     factory CarouselSliderModel.fromJson(Map<String, dynamic> json) => CarouselSliderModel(
//         success: json["success"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     int id;
//     DateTime createdAt;
//     DateTime updatedAt;
//     DateTime publishedAt;
//     String locale;
//     List<Image> images;

//     Data({
//         required this.id,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.publishedAt,
//         required this.locale,
//         required this.images,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         locale: json["locale"],
//         images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "publishedAt": publishedAt.toIso8601String(),
//         "locale": locale,
//         "images": List<dynamic>.from(images.map((x) => x.toJson())),
//     };
// }

// class Image {
//     int id;
//     String url;
//     Formats formats;

//     Image({
//         required this.id,
//         required this.url,
//         required this.formats,
//     });

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         url: json["url"],
//         formats: Formats.fromJson(json["formats"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "formats": formats.toJson(),
//     };
// }

// class Formats {
//     Thumbnail? large;
//     Thumbnail? small;
//     Thumbnail? medium;
//     Thumbnail thumbnail;

//     Formats({
//         this.large,
//         this.small,
//         this.medium,
//         required this.thumbnail,
//     });

//     factory Formats.fromJson(Map<String, dynamic> json) => Formats(
//         large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
//         small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
//         medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
//         thumbnail: Thumbnail.fromJson(json["thumbnail"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "large": large?.toJson(),
//         "small": small?.toJson(),
//         "medium": medium?.toJson(),
//         "thumbnail": thumbnail.toJson(),
//     };
// }

// class Thumbnail {
//     String ext;
//     String url;
//     String hash;
//     String mime;
//     String name;
//     dynamic path;
//     double size;
//     int width;
//     int height;
//     int sizeInBytes;

//     Thumbnail({
//         required this.ext,
//         required this.url,
//         required this.hash,
//         required this.mime,
//         required this.name,
//         required this.path,
//         required this.size,
//         required this.width,
//         required this.height,
//         required this.sizeInBytes,
//     });

//     factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
//         ext: json["ext"],
//         url: json["url"],
//         hash: json["hash"],
//         mime: json["mime"],
//         name: json["name"],
//         path: json["path"],
//         size: json["size"]?.toDouble(),
//         width: json["width"],
//         height: json["height"],
//         sizeInBytes: json["sizeInBytes"],
//     );

//     Map<String, dynamic> toJson() => {
//         "ext": ext,
//         "url": url,
//         "hash": hash,
//         "mime": mime,
//         "name": name,
//         "path": path,
//         "size": size,
//         "width": width,
//         "height": height,
//         "sizeInBytes": sizeInBytes,
//     };
// }

import 'dart:convert';

CarouselSliderModel carouselSliderModelFromJson(String str) =>
    CarouselSliderModel.fromJson(json.decode(str));

String carouselSliderModelToJson(CarouselSliderModel data) =>
    json.encode(data.toJson());

class CarouselSliderModel {
  bool success;
  String message;
  Data data;

  CarouselSliderModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CarouselSliderModel.fromJson(Map<String, dynamic> json) =>
      CarouselSliderModel(
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
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String locale;
  List<ImageData> images;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        images: List<ImageData>.from(
            json["images"].map((x) => ImageData.fromJson(x))),
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

class ImageData {
  int id;
  String url;
  Formats formats;

  ImageData({
    required this.id,
    required this.url,
    required this.formats,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
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
        large:
            json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
        small:
            json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
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

