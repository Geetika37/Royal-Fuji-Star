// To parse this JSON data, do
//
//     final historyResponse = historyResponseFromJson(jsonString);

import 'dart:convert';

HistoryResponse historyResponseFromJson(String str) =>
    HistoryResponse.fromJson(json.decode(str));

String historyResponseToJson(HistoryResponse data) =>
    json.encode(data.toJson());

class HistoryResponse {
  bool success;
  String message;
  Data data;

  HistoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      HistoryResponse(
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
  List<Advisory> advisories;
  List<AnnualMaintanence> annualMaintanences;
  List<ProductEnquiry> productEnquiries;
  List<Repair> repairs;
  List<SpareEnquiry> spareEnquiries;
  List<SpareNotFound> spareNotFounds;

  Data({
    required this.id,
    required this.advisories,
    required this.annualMaintanences,
    required this.productEnquiries,
    required this.repairs,
    required this.spareEnquiries,
    required this.spareNotFounds,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        advisories: List<Advisory>.from(
            json["advisories"].map((x) => Advisory.fromJson(x))),
        annualMaintanences: List<AnnualMaintanence>.from(
            json["annualMaintanences"]
                .map((x) => AnnualMaintanence.fromJson(x))),
        productEnquiries: List<ProductEnquiry>.from(
            json["productEnquiries"].map((x) => ProductEnquiry.fromJson(x))),
        repairs:
            List<Repair>.from(json["repairs"].map((x) => Repair.fromJson(x))),
        spareEnquiries: List<SpareEnquiry>.from(
            json["spareEnquiries"].map((x) => SpareEnquiry.fromJson(x))),
        spareNotFounds: List<SpareNotFound>.from(
            json["spareNotFounds"].map((x) => SpareNotFound.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "advisories": List<dynamic>.from(advisories.map((x) => x.toJson())),
        "annualMaintanences":
            List<dynamic>.from(annualMaintanences.map((x) => x.toJson())),
        "productEnquiries":
            List<dynamic>.from(productEnquiries.map((x) => x.toJson())),
        "repairs": List<dynamic>.from(repairs.map((x) => x.toJson())),
        "spareEnquiries":
            List<dynamic>.from(spareEnquiries.map((x) => x.toJson())),
        "spareNotFounds":
            List<dynamic>.from(spareNotFounds.map((x) => x.toJson())),
      };
}

class Advisory {
  int id;
  String typeOfConsultation;
  String description;
  String commentsOrQuestion;
  DateTime createdAt;
  List<AdvisoryUploadImage>? uploadImages;

  Advisory({
    required this.id,
    required this.typeOfConsultation,
    required this.description,
    required this.commentsOrQuestion,
    required this.createdAt,
    required this.uploadImages,
  });

  factory Advisory.fromJson(Map<String, dynamic> json) => Advisory(
        id: json["id"],
        typeOfConsultation: json["typeOfConsultation"],
        description: json["description"],
        commentsOrQuestion: json["commentsOrQuestion"],
        createdAt: DateTime.parse(json["createdAt"]),
        uploadImages: json["uploadImages"] == null
            ? []
            : List<AdvisoryUploadImage>.from(json["uploadImages"]!
                .map((x) => AdvisoryUploadImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeOfConsultation": typeOfConsultation,
        "description": description,
        "commentsOrQuestion": commentsOrQuestion,
        "createdAt": createdAt.toIso8601String(),
        "uploadImages": uploadImages == null
            ? []
            : List<dynamic>.from(uploadImages!.map((x) => x.toJson())),
      };
}

class AdvisoryUploadImage {
  int id;
  String url;
  PurpleFormats formats;

  AdvisoryUploadImage({
    required this.id,
    required this.url,
    required this.formats,
  });

  factory AdvisoryUploadImage.fromJson(Map<String, dynamic> json) =>
      AdvisoryUploadImage(
        id: json["id"],
        url: json["url"],
        formats: PurpleFormats.fromJson(json["formats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "formats": formats.toJson(),
      };
}

class PurpleFormats {
  Thumbnail thumbnail;
  // Thumbnail? small;
  // Thumbnail? medium;

  PurpleFormats({
    required this.thumbnail,
    // this.small,
    // this.medium,
  });

  factory PurpleFormats.fromJson(Map<String, dynamic> json) => PurpleFormats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        // small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        // medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        // "small": small?.toJson(),
        // "medium": medium?.toJson(),
      };
}

class Thumbnail {
  // Ext ext;
  String url;
  // String hash;
  // Mime mime;
  // String name;
  // dynamic path;
  // double size;
  // int width;
  // int height;
  // int sizeInBytes;

  Thumbnail({
    // required this.ext,
    required this.url,
    // required this.hash,
    // required this.mime,
    // required this.name,
    // required this.path,
    // required this.size,
    // required this.width,
    // required this.height,
    // required this.sizeInBytes,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        // ext: extValues.map[json["ext"]]!,
        url: json["url"],
        // hash: json["hash"],
        // mime: mimeValues.map[json["mime"]]!,
        // name: json["name"],
        // path: json["path"],
        // size: json["size"]?.toDouble(),
        // width: json["width"],
        // height: json["height"],
        // sizeInBytes: json["sizeInBytes"],
      );

  Map<String, dynamic> toJson() => {
        // "ext": extValues.reverse[ext],
        "url": url,
        // "hash": hash,
        // "mime": mimeValues.reverse[mime],
        // "name": name,
        // "path": path,
        // "size": size,
        // "width": width,
        // "height": height,
        // "sizeInBytes": sizeInBytes,
      };
}

// enum Ext {
//     JPG
// }

// final extValues = EnumValues({
//     ".jpg": Ext.JPG
// });

// enum Mime {
//     APPLICATION_OCTET_STREAM,
//     IMAGE_JPEG
// }

// final mimeValues = EnumValues({
//     "application/octet-stream": Mime.APPLICATION_OCTET_STREAM,
//     "image/jpeg": Mime.IMAGE_JPEG
// });

class AnnualMaintanence {
  int id;
  String brand;
  String capacity;
  int numberOfFloors;
  String type;
  String description;
  DateTime createdAt;

  AnnualMaintanence({
    required this.id,
    required this.brand,
    required this.capacity,
    required this.numberOfFloors,
    required this.type,
    required this.description,
    required this.createdAt,
  });

  factory AnnualMaintanence.fromJson(Map<String, dynamic> json) =>
      AnnualMaintanence(
        id: json["id"],
        brand: json["brand"],
        capacity: json["capacity"],
        numberOfFloors: json["numberOfFloors"],
        type: json["type"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "capacity": capacity,
        "numberOfFloors": numberOfFloors,
        "type": type,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
      };
}

class ProductEnquiry {
  int id;
  DateTime createdAt;
  Product product;
  List<Product> components;

  ProductEnquiry({
    required this.id,
    required this.createdAt,
    required this.product,
    required this.components,
  });

  factory ProductEnquiry.fromJson(Map<String, dynamic> json) => ProductEnquiry(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        product: Product.fromJson(json["product"]),
        components: List<Product>.from(
            json["components"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "product": product.toJson(),
        "components": List<dynamic>.from(components.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  Locale locale;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: localeValues.map[json["locale"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": localeValues.reverse[locale],
      };
}

enum Locale { EN }

final localeValues = EnumValues({"en": Locale.EN});

class Repair {
  int id;
  String brand;
  String typeOfRepairs;
  String description;
  DateTime createdAt;
  List<RepairUploadImage> uploadImages;

  Repair({
    required this.id,
    required this.brand,
    required this.typeOfRepairs,
    required this.description,
    required this.createdAt,
    required this.uploadImages,
  });

  factory Repair.fromJson(Map<String, dynamic> json) => Repair(
        id: json["id"],
        brand: json["brand"],
        typeOfRepairs: json["typeOfRepairs"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        uploadImages: List<RepairUploadImage>.from(
            json["uploadImages"].map((x) => RepairUploadImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "typeOfRepairs": typeOfRepairs,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "uploadImages": List<dynamic>.from(uploadImages.map((x) => x.toJson())),
      };
}

class RepairUploadImage {
  int id;
  String url;
  // FluffyFormats? formats;

  RepairUploadImage({
    required this.id,
    required this.url,
    // this.formats,
  });

  factory RepairUploadImage.fromJson(Map<String, dynamic> json) {
    return RepairUploadImage(
      id: json["id"],
      url: json["url"],
      // formats: json["formats"] != null
      //     ? FluffyFormats.fromJson(json["formats"])
      //     : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        // "formats": formats?.toJson(),
      };
}

// class FluffyFormats {
//   Thumbnail thumbnail;

//   FluffyFormats({
//     required this.thumbnail,
//   });

//   factory FluffyFormats.fromJson(Map<String, dynamic> json) => FluffyFormats(
//         thumbnail: Thumbnail.fromJson(json["thumbnail"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "thumbnail": thumbnail.toJson(),
//       };
// }

class SpareEnquiry {
  int id;
  DateTime createdAt;
  Product? spare;

  SpareEnquiry({
    required this.id,
    required this.createdAt,
    required this.spare,
  });

  factory SpareEnquiry.fromJson(Map<String, dynamic> json) => SpareEnquiry(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        spare: json["spare"] != null ? Product.fromJson(json["spare"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "spare": spare?.toJson(),
      };
}

class SpareNotFound {
  int id;
  String description;
  DateTime createdAt;
  List<AdvisoryUploadImage>? uploadImages;

  SpareNotFound({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.uploadImages,
  });

  factory SpareNotFound.fromJson(Map<String, dynamic> json) => SpareNotFound(
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        uploadImages: json["uploadImages"] == null
            ? []
            : List<AdvisoryUploadImage>.from(json["uploadImages"]!
                .map((x) => AdvisoryUploadImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "uploadImages": uploadImages == null
            ? []
            : List<dynamic>.from(uploadImages!.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
