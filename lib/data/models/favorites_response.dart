import 'dart:convert';

import 'package:spotify_viewer/data/models/music_search_response.dart';

class FavoritesResponse {
  String? href;
  List<FavoritesItem>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  FavoritesResponse({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory FavoritesResponse.fromJson(String str) =>
      FavoritesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoritesResponse.fromMap(Map<String, dynamic> json) =>
      FavoritesResponse(
        href: json["href"],
        items:
            json["items"] == null
                ? []
                : List<FavoritesItem>.from(
                  json["items"]!.map((x) => FavoritesItem.fromMap(x)),
                ),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
    "href": href,
    "items":
        items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
  };
}

class FavoritesItem {
  DateTime? addedAt;
  TracksItem? track;

  FavoritesItem({this.addedAt, this.track});

  factory FavoritesItem.fromJson(String str) =>
      FavoritesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoritesItem.fromMap(Map<String, dynamic> json) => FavoritesItem(
    addedAt: json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
    track: json["track"] == null ? null : TracksItem.fromMap(json["track"]),
  );

  Map<String, dynamic> toMap() => {
    "added_at": addedAt?.toIso8601String(),
    "track": track?.toMap(),
  };
}
