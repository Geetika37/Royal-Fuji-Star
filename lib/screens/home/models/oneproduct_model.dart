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
    String locale;
    Category productCategory;
    Brochure? mainImage;
    List<Brochure>? gallery;
    Brochure? brochure;
    List<Component>? components;

    Data({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
         this.publishedAt,
        required this.locale,
        required this.productCategory,
        this.mainImage,
        this.gallery,
        this.brochure,
        this.components,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] != null ? DateTime.parse(json["publishedAt"]) : null,
        locale: json["locale"],
        productCategory: Category.fromJson(json["productCategory"]),
        mainImage: json["mainImage"] == null ? null : Brochure.fromJson(json["mainImage"]),
        gallery: json["gallery"] == null ? null : List<Brochure>.from(json["gallery"].map((x) => Brochure.fromJson(x))),
        brochure: json["brochure"] == null ? null : Brochure.fromJson(json["brochure"]),
        components: json["components"] == null ? null : List<Component>.from(json["components"].map((x) => Component.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": locale,
        "productCategory": productCategory.toJson(),
        "mainImage": mainImage?.toJson(),
        "gallery": gallery == null ? null : List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "brochure": brochure?.toJson(),
        "components": components == null ? null : List<dynamic>.from(components!.map((x) => x.toJson())),
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
        id: json["id"],
        url: json["url"] ?? '',  // Handle nullable url
        formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
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
        medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
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
        this.path,
        required this.size,
        required this.width,
        required this.height,
        required this.sizeInBytes,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        ext: extValues.map[json["ext"]]!,
        url: json["url"] ?? '',  // Handle nullable url
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

class Category {
    int id;
    String name;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime? publishedAt;
    String locale;

    Category({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
         this.publishedAt,
        required this.locale,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',  // Handle nullable description
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        // publishedAt: DateTime.parse(json["publishedAt"]),
         publishedAt: json["publishedAt"] != null ? DateTime.parse(json["publishedAt"]) : null,
        locale: json["locale"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": locale,
    };
}

class Component {
    int? id;
    String? title;
    String description;
    Brochure? image;

    Component({
        required this.id,
        required this.title,
        required this.description,
        this.image,
    });

    factory Component.fromJson(Map<String, dynamic> json) => Component(
        // id: json["id"] == null ? null : json["id"],
        id: json['id'] == null ? null : json['id'],

        title: json["title"] == null ? null :json['title'],
        description: json["description"] ?? '',  // Handle nullable description
        image: json["image"] == null ? null : Brochure.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image?.toJson(),
    };
}


class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}





// class Product {
//   final int id;
//   final String name;
//   final String description;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final DateTime publishedAt;
//   final String locale;
//   final ProductCategory productCategory;
//   final ProductImage mainImage;
//   final List<ProductComponent> components;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.locale,
//     required this.productCategory,
//     required this.mainImage,
//     required this.components,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       publishedAt: json['publishedAt'] != null
//           ? DateTime.parse(json['publishedAt'])
//           : DateTime.now(), // Example of handling null date
//       locale: json['locale'],
//       productCategory: json['productCategory'] != null
//           ? ProductCategory.fromJson(json['productCategory'])
//           : ProductCategory(
//               id: 0, name: ''), // Example of handling null category
//       mainImage: json['mainImage'] != null
//           ? ProductImage.fromJson(json['mainImage'])
//           : ProductImage(id: 0, url: ''), // Example of handling null main image
//       components: (json['components'] as List<dynamic>? ?? [])
//           .map((componentJson) => ProductComponent.fromJson(componentJson))
//           .toList(),
//     );
//   }
// }

// class ProductCategory {
//   final int id;
//   final String name;

//   ProductCategory({required this.id, required this.name});

//   factory ProductCategory.fromJson(Map<String, dynamic> json) {
//     return ProductCategory(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

// class ProductImage {
//   final int id;
//   final String url;

//   ProductImage({required this.id, required this.url});

//   factory ProductImage.fromJson(Map<String, dynamic> json) {
//     return ProductImage(
//       id: json['id'],
//       url: json['url'],
//     );
//   }
// }

// class ProductComponent {
//   final List<ComponentItem> panel;
//   final List<ComponentItem> floor;
//   final List<ComponentItem> ceiling;
//   final List<ComponentItem> handrail;
//   final List<ComponentItem> cabin;

//   ProductComponent({
//     required this.panel,
//     required this.floor,
//     required this.ceiling,
//     required this.handrail,
//     required this.cabin,
//   });

//   factory ProductComponent.fromJson(Map<String, dynamic> json) {
//     return ProductComponent(
//       panel: (json['panel'] as List<dynamic>? ?? [])
//           .map((item) => ComponentItem.fromJson(item))
//           .toList(),
//       floor: (json['floor'] as List<dynamic>? ?? [])
//           .map((item) => ComponentItem.fromJson(item))
//           .toList(),
//       ceiling: (json['ceiling'] as List<dynamic>? ?? [])
//           .map((item) => ComponentItem.fromJson(item))
//           .toList(),
//       handrail: (json['handrail'] as List<dynamic>? ?? [])
//           .map((item) => ComponentItem.fromJson(item))
//           .toList(),
//       cabin: (json['cabin'] as List<dynamic>? ?? [])
//           .map((item) => ComponentItem.fromJson(item))
//           .toList(),
//     );
//   }
// }

// class ComponentItem {
//   final String name;
//   final String description;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final DateTime publishedAt;
//   final List<GalleryItem> gallery;

//   ComponentItem({
//     required this.name,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.gallery,
//   });

//   factory ComponentItem.fromJson(Map<String, dynamic> json) {
//     return ComponentItem(
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       createdAt: DateTime.parse(json['createdAt'] ?? ''),
//       updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
//       publishedAt: DateTime.parse(json['publishedAt'] ?? ''),
//       gallery: (json['gallery'] as List<dynamic>? ?? [])
//           .map((item) => GalleryItem.fromJson(item))
//           .toList(),
//     );
//   }
// }

// class GalleryItem {
//   final int id;
//   final String url;

//   GalleryItem({required this.id, required this.url});

//   factory GalleryItem.fromJson(Map<String, dynamic> json) {
//     return GalleryItem(
//       id: json['id'],
//       url: json['url'],
//     );
//   }
// }