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
    DateTime publishedAt;
    Locale locale;
    Category productCategory;
    Brochure mainImage;
    List<Brochure> gallery;
    Brochure brochure;
    List<Component> components;

    Data({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.locale,
        required this.productCategory,
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
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: localeValues.map[json["locale"]]!,
        productCategory: Category.fromJson(json["productCategory"] ?? {}),
        mainImage: Brochure.fromJson(json["mainImage"] ?? {}),
        gallery: json["gallery"] != null 
            ? List<Brochure>.from(json["gallery"].map((x) => Brochure.fromJson(x)))
            : [],  // handle null gallery
        brochure: Brochure.fromJson(json["brochure"] ?? {}),
        components: json["components"] != null 
            ? List<Component>.from(json["components"].map((x) => Component.fromJson(x)))
            : [],  // handle null components
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": localeValues.reverse[locale],
        "productCategory": productCategory.toJson(),
        "mainImage": mainImage.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "brochure": brochure.toJson(),
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
    this.formats,
  });

  factory Brochure.fromJson(Map<String, dynamic> json) => Brochure(
    id: json["id"] ?? 0, // Provide a default value for id if it's null
    url: json["url"] ?? '', // Provide a default value for url if it's null
    formats: json["formats"] != null ? Formats.fromJson(json["formats"]) : null,
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

  Formats({
    this.large,
    this.small,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    large: json["large"] != null ? Thumbnail.fromJson(json["large"]) : null,
    small: json["small"] != null ? Thumbnail.fromJson(json["small"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "large": large?.toJson(),
    "small": small?.toJson(),
  };
}

class Thumbnail {
  String url;

  Thumbnail({
    required this.url,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    url: json["url"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}


enum Ext {
    JPG
}

final extValues = EnumValues({
    ".jpg": Ext.JPG
});

enum Mime {
    IMAGE_JPEG
}

final mimeValues = EnumValues({
    "image/jpeg": Mime.IMAGE_JPEG
});

class Component {
    List<Cabin>? panel;
    List<Cabin>? floor;
    List<Cabin>? ceiling;
    List<Cabin>? handrail;
    List<Cabin>? cabin;

    Component({
        this.panel,
        this.floor,
        this.ceiling,
        this.handrail,
        this.cabin,
    });

    factory Component.fromJson(Map<String, dynamic> json) => Component(
        panel: json["panel"] == null ? [] : List<Cabin>.from(json["panel"]!.map((x) => Cabin.fromJson(x))),
        floor: json["floor"] == null ? [] : List<Cabin>.from(json["floor"]!.map((x) => Cabin.fromJson(x))),
        ceiling: json["ceiling"] == null ? [] : List<Cabin>.from(json["ceiling"]!.map((x) => Cabin.fromJson(x))),
        handrail: json["handrail"] == null ? [] : List<Cabin>.from(json["handrail"]!.map((x) => Cabin.fromJson(x))),
        cabin: json["cabin"] == null ? [] : List<Cabin>.from(json["cabin"]!.map((x) => Cabin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "panel": panel == null ? [] : List<dynamic>.from(panel!.map((x) => x.toJson())),
        "floor": floor == null ? [] : List<dynamic>.from(floor!.map((x) => x.toJson())),
        "ceiling": ceiling == null ? [] : List<dynamic>.from(ceiling!.map((x) => x.toJson())),
        "handrail": handrail == null ? [] : List<dynamic>.from(handrail!.map((x) => x.toJson())),
        "cabin": cabin == null ? [] : List<dynamic>.from(cabin!.map((x) => x.toJson())),
    };
}

class Cabin {
    String name;
    int id;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    Locale locale;
    Category subCategory;
    List<Brochure> gallery;

    Cabin({
        required this.name,
        required this.id,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.locale,
        required this.subCategory,
        required this.gallery,
    });

    factory Cabin.fromJson(Map<String, dynamic> json) => Cabin(
        name: json["name"],
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: localeValues.map[json["locale"]]!,
        subCategory: Category.fromJson(json["subCategory"]),
        gallery: List<Brochure>.from(json["gallery"].map((x) => Brochure.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": localeValues.reverse[locale],
        "subCategory": subCategory.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String name;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    Locale locale;

    Category({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.locale,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
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

enum Locale {
    EN
}

final localeValues = EnumValues({
    "en": Locale.EN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}





// class Product {
//   bool success;
//   String message;
//   Data data;

//   Product({
//     required this.success,
//     required this.message,
//     required this.data,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         success: json["success"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   int id;
//   String name;
//   String description;
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime? publishedAt;
//   String locale;
//   Category productCategory;
//   Brochure? mainImage;
//   List<Brochure>? gallery;
//   Brochure? brochure;
//   List<Component>? components;

//   Data({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     this.publishedAt,
//     required this.locale,
//     required this.productCategory,
//     this.mainImage,
//     this.gallery,
//     this.brochure,
//     this.components,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: json["publishedAt"] != null
//             ? DateTime.parse(json["publishedAt"])
//             : null,
//         locale: json["locale"],
//         productCategory: Category.fromJson(json["productCategory"]),
//         mainImage: json["mainImage"] != null
//             ? Brochure.fromJson(json["mainImage"])
//             : null,
//         gallery: json["gallery"] != null
//             ? List<Brochure>.from(
//                 json["gallery"].map((x) => Brochure.fromJson(x)))
//             : null,
//         brochure: json["brochure"] != null
//             ? Brochure.fromJson(json["brochure"])
//             : null,
//         components: json["components"] != null
//             ? List<Component>.from(
//                 json["components"].map((x) => Component.fromJson(x)))
//             : null,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "publishedAt": publishedAt?.toIso8601String(),
//         "locale": locale,
//         "productCategory": productCategory.toJson(),
//         "mainImage": mainImage?.toJson(),
//         "gallery": gallery != null
//             ? List<dynamic>.from(gallery!.map((x) => x.toJson()))
//             : null,
//         "brochure": brochure?.toJson(),
//         "components": components != null
//             ? List<dynamic>.from(components!.map((x) => x.toJson()))
//             : null,
//       };
// }

// class Brochure {
//   int id;
//   String url;
//   Formats? formats;

//   Brochure({
//     required this.id,
//     required this.url,
//     this.formats,
//   });

//   factory Brochure.fromJson(Map<String, dynamic> json) => Brochure(
//         id: json["id"],
//         url: json["url"] ?? '',
//         formats:
//             json["formats"] != null ? Formats.fromJson(json["formats"]) : null,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "formats": formats?.toJson(),
//       };
// }

// class Formats {
//   Format? large;
//   Format? small;
//   Format? medium;
//   Format thumbnail;

//   Formats({
//     this.large,
//     this.small,
//     this.medium,
//     required this.thumbnail,
//   });

//   factory Formats.fromJson(Map<String, dynamic> json) => Formats(
//         large: json["large"] != null ? Format.fromJson(json["large"]) : null,
//         small: json["small"] != null ? Format.fromJson(json["small"]) : null,
//         medium: json["medium"] != null ? Format.fromJson(json["medium"]) : null,
//         thumbnail: Format.fromJson(json["thumbnail"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "large": large?.toJson(),
//         "small": small?.toJson(),
//         "medium": medium?.toJson(),
//         "thumbnail": thumbnail.toJson(),
//       };
// }

// class Format {
//   String ext;
//   String url;
//   String hash;
//   String mime;
//   String name;
//   double size; // Keeping size as double
//   int width;
//   int height;
//   int sizeInBytes;

//   Format({
//     required this.ext,
//     required this.url,
//     required this.hash,
//     required this.mime,
//     required this.name,
//     required this.size,
//     required this.width,
//     required this.height,
//     required this.sizeInBytes,
//   });

//   factory Format.fromJson(Map<String, dynamic> json) => Format(
//         ext: json["ext"],
//         url: json["url"] ?? '',
//         hash: json["hash"],
//         mime: json["mime"],
//         name: json["name"],
//         size: (json["size"] as num).toDouble(), // Convert to double
//         width: json["width"],
//         height: json["height"],
//         sizeInBytes: json["sizeInBytes"],
//       );

//   Map<String, dynamic> toJson() => {
//         "ext": ext,
//         "url": url,
//         "hash": hash,
//         "mime": mime,
//         "name": name,
//         "size": size,
//         "width": width,
//         "height": height,
//         "sizeInBytes": sizeInBytes,
//       };
// }

// class Category {
//   int id;
//   String name;
//   String description;
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime? publishedAt;
//   String locale;

//   Category({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     this.publishedAt,
//     required this.locale,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"] ?? '',
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: json["publishedAt"] != null
//             ? DateTime.parse(json["publishedAt"])
//             : null,
//         locale: json["locale"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "publishedAt": publishedAt?.toIso8601String(),
//         "locale": locale,
//       };
// }

// class ImageFormat {
//   String ext;
//   String url;
//   String hash;
//   String mime;
//   String name;
//   String? path;
//   double size;
//   int width;
//   int height;
//   int sizeInBytes;

//   ImageFormat({
//     required this.ext,
//     required this.url,
//     required this.hash,
//     required this.mime,
//     required this.name,
//     this.path,
//     required this.size,
//     required this.width,
//     required this.height,
//     required this.sizeInBytes,
//   });

//   factory ImageFormat.fromJson(Map<String, dynamic> json) => ImageFormat(
//         ext: json["ext"],
//         url: json["url"] ?? '',
//         hash: json["hash"],
//         mime: json["mime"],
//         name: json["name"],
//         path: json["path"],
//         size: json["size"].toDouble(),
//         width: json["width"],
//         height: json["height"],
//         sizeInBytes: json["sizeInBytes"],
//       );

//   Map<String, dynamic> toJson() => {
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
//       };
// }

// class Gallery {
//   int id;
//   String url;
//   Map<String, ImageFormat> formats;

//   Gallery({
//     required this.id,
//     required this.url,
//     required this.formats,
//   });

//   factory Gallery.fromJson(Map<String, dynamic> json) {
//     Map<String, ImageFormat> formats = {};
//     if (json["formats"] != null) {
//       json["formats"].forEach((key, value) {
//         formats[key] = ImageFormat.fromJson(value);
//       });
//     }
//     return Gallery(
//       id: json["id"],
//       url: json["url"],
//       formats: formats,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "formats": Map.from(formats).map((k, v) => MapEntry(k, v.toJson())),
//       };
// }

// class SubCategory {
//   int id;
//   String name;
//   String createdAt;
//   String updatedAt;
//   String publishedAt;
//   String locale;

//   SubCategory({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.locale,
//   });

//   factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
//         id: json["id"],
//         name: json["name"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         publishedAt: json["publishedAt"],
//         locale: json["locale"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "publishedAt": publishedAt,
//         "locale": locale,
//       };
// }

// class Component {
//   int id;
//   String name;
//   String description;
//   String createdAt;
//   String updatedAt;
//   String publishedAt;
//   String locale;
//   SubCategory? subCategory;
//   List<Gallery> gallery;

//   Component({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.locale,
//     this.subCategory,
//     required this.gallery,
//   });

//   factory Component.fromJson(Map<String, dynamic> json) {
//     List<Gallery> gallery = [];
//     if (json["gallery"] != null) {
//       json["gallery"].forEach((v) {
//         gallery.add(Gallery.fromJson(v));
//       });
//     }
//     return Component(
//       id: json["id"] ?? 0,
//       name: json["name"] ?? '',
//       description: json["description"] ?? '',
//       createdAt: json["createdAt"] ?? '',
//       updatedAt: json["updatedAt"] ?? '',
//       publishedAt: json["publishedAt"] ?? '',
//       locale: json["locale"] ?? '',
//       subCategory: json["subCategory"] != null
//           ? SubCategory.fromJson(json["subCategory"])
//           : null,
//       gallery: gallery,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "publishedAt": publishedAt,
//         "locale": locale,
//         "subCategory": subCategory?.toJson(),
//         "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return reverseMap!;
//   }
// }

// // Enum values for demonstration (add others if needed)
// enum Ext { JPG }

// final extValues = EnumValues({".jpg": Ext.JPG});

// enum Mime { IMAGE_JPEG }

// final mimeValues = EnumValues({"image/jpeg": Mime.IMAGE_JPEG});




