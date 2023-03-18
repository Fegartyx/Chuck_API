import 'dart:convert';

class Model {
  Model({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  final List<dynamic>? categories;
  final String? createdAt;
  final String? iconUrl;
  final String? id;
  final String? updatedAt;
  final String? url;
  final String? value;

  factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        createdAt: json["created_at"],
        iconUrl: json["icon_url"],
        id: json["id"],
        updatedAt: json["updated_at"],
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "created_at": createdAt,
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt,
        "url": url,
        "value": value,
      };
}
