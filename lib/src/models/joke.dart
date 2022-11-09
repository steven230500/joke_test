import 'dart:convert';

Joke jokeFromJson(String str) => Joke.fromJson(json.decode(str));

String jokeToJson(Joke data) => json.encode(data.toJson());

class Joke {
  Joke({
    this.createdAt,
    this.updatedAt,
    this.iconUrl,
    this.categories,
    this.id,
    this.url,
    this.value,
  });

  String? createdAt;
  String? updatedAt;
  String? iconUrl;
  List<dynamic>? categories;
  String? id;
  String? url;
  String? value;

  Joke copyWith({
    String? createdAt,
    String? updatedAt,
    String? iconUrl,
    List<dynamic>? categories,
    String? id,
    String? url,
    String? value,
  }) =>
      Joke(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        iconUrl: iconUrl ?? this.iconUrl,
        categories: categories ?? this.categories,
        id: id ?? this.id,
        url: url ?? this.url,
        value: value ?? this.value,
      );

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        iconUrl: json["icon_url"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        id: json["id"],
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "updated_at": updatedAt,
        "icon_url": iconUrl,
        "categories": List<dynamic>.from(categories?.map((x) => x) ?? []),
        "id": id,
        "url": url,
        "value": value,
      };
}
