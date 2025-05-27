import 'dart:convert';

class MusicSearchResponse {
  Tracks? tracks;
  Artists? artists;
  Albums? albums;

  MusicSearchResponse({this.tracks, this.artists, this.albums});

  factory MusicSearchResponse.fromJson(String str) =>
      MusicSearchResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MusicSearchResponse.fromMap(Map<String, dynamic> json) =>
      MusicSearchResponse(
        tracks: json["tracks"] == null ? null : Tracks.fromMap(json["tracks"]),
        artists:
            json["artists"] == null ? null : Artists.fromMap(json["artists"]),
        albums: json["albums"] == null ? null : Albums.fromMap(json["albums"]),
      );

  Map<String, dynamic> toMap() => {
    "tracks": tracks?.toMap(),
    "artists": artists?.toMap(),
    "albums": albums?.toMap(),
  };
}

class Albums {
  String? href;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;
  List<AlbumElement>? items;

  Albums({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Albums.fromJson(String str) => Albums.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Albums.fromMap(Map<String, dynamic> json) => Albums(
    href: json["href"],
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    total: json["total"],
    items:
        json["items"] == null
            ? []
            : List<AlbumElement>.from(
              json["items"]!.map((x) => AlbumElement.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "href": href,
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
    "items":
        items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class AlbumElement {
  String? albumType;
  int? totalTracks;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  String? type;
  String? uri;
  List<Artist>? artists;
  bool? isPlayable;

  AlbumElement({
    this.albumType,
    this.totalTracks,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.type,
    this.uri,
    this.artists,
    this.isPlayable,
  });

  factory AlbumElement.fromJson(String str) =>
      AlbumElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlbumElement.fromMap(Map<String, dynamic> json) => AlbumElement(
    albumType: json["album_type"],
    totalTracks: json["total_tracks"],
    availableMarkets:
        json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
    externalUrls:
        json["external_urls"] == null
            ? null
            : ExternalUrls.fromMap(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images:
        json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromMap(x))),
    name: json["name"],
    releaseDate: json["release_date"],
    releaseDatePrecision: json["release_date_precision"],
    type: json["type"],
    uri: json["uri"],
    artists:
        json["artists"] == null
            ? []
            : List<Artist>.from(json["artists"]!.map((x) => Artist.fromMap(x))),
    isPlayable: json["is_playable"],
  );

  Map<String, dynamic> toMap() => {
    "album_type": albumType,
    "total_tracks": totalTracks,
    "available_markets":
        availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
    "external_urls": externalUrls?.toMap(),
    "href": href,
    "id": id,
    "images":
        images == null ? [] : List<dynamic>.from(images!.map((x) => x.toMap())),
    "name": name,
    "release_date": releaseDate,
    "release_date_precision": releaseDatePrecision,
    "type": type,
    "uri": uri,
    "artists":
        artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toMap())),
    "is_playable": isPlayable,
  };
}

class Artist {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artist.fromJson(String str) => Artist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Artist.fromMap(Map<String, dynamic> json) => Artist(
    externalUrls:
        json["external_urls"] == null
            ? null
            : ExternalUrls.fromMap(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    name: json["name"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toMap() => {
    "external_urls": externalUrls?.toMap(),
    "href": href,
    "id": id,
    "name": name,
    "type": type,
    "uri": uri,
  };
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(String str) =>
      ExternalUrls.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExternalUrls.fromMap(Map<String, dynamic> json) =>
      ExternalUrls(spotify: json["spotify"]);

  Map<String, dynamic> toMap() => {"spotify": spotify};
}

class Image {
  int? height;
  int? width;
  String? url;

  Image({this.height, this.width, this.url});

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) =>
      Image(height: json["height"], width: json["width"], url: json["url"]);

  Map<String, dynamic> toMap() => {
    "height": height,
    "width": width,
    "url": url,
  };
}

class Artists {
  String? href;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;
  List<ArtistsItem>? items;

  Artists({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Artists.fromJson(String str) => Artists.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Artists.fromMap(Map<String, dynamic> json) => Artists(
    href: json["href"],
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    total: json["total"],
    items:
        json["items"] == null
            ? []
            : List<ArtistsItem>.from(
              json["items"]!.map((x) => ArtistsItem.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "href": href,
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
    "items":
        items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class ArtistsItem {
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  ArtistsItem({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory ArtistsItem.fromJson(String str) =>
      ArtistsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArtistsItem.fromMap(Map<String, dynamic> json) => ArtistsItem(
    externalUrls:
        json["external_urls"] == null
            ? null
            : ExternalUrls.fromMap(json["external_urls"]),
    followers:
        json["followers"] == null ? null : Followers.fromMap(json["followers"]),
    genres:
        json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
    href: json["href"],
    id: json["id"],
    images:
        json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromMap(x))),
    name: json["name"],
    popularity: json["popularity"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toMap() => {
    "external_urls": externalUrls?.toMap(),
    "followers": followers?.toMap(),
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
    "href": href,
    "id": id,
    "images":
        images == null ? [] : List<dynamic>.from(images!.map((x) => x.toMap())),
    "name": name,
    "popularity": popularity,
    "type": type,
    "uri": uri,
  };
}

class Followers {
  dynamic href;
  int? total;

  Followers({this.href, this.total});

  factory Followers.fromJson(String str) => Followers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Followers.fromMap(Map<String, dynamic> json) =>
      Followers(href: json["href"], total: json["total"]);

  Map<String, dynamic> toMap() => {"href": href, "total": total};
}

class Tracks {
  String? href;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;
  List<TracksItem>? items;

  Tracks({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Tracks.fromJson(String str) => Tracks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
    href: json["href"],
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    total: json["total"],
    items:
        json["items"] == null
            ? []
            : List<TracksItem>.from(
              json["items"]!.map((x) => TracksItem.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "href": href,
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
    "items":
        items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class TracksItem {
  AlbumElement? album;
  List<Artist>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  bool? isPlayable;
  String? name;
  int? popularity;
  dynamic previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  TracksItem({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory TracksItem.fromJson(String str) =>
      TracksItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TracksItem.fromMap(Map<String, dynamic> json) => TracksItem(
    album: json["album"] == null ? null : AlbumElement.fromMap(json["album"]),
    artists:
        json["artists"] == null
            ? []
            : List<Artist>.from(json["artists"]!.map((x) => Artist.fromMap(x))),
    availableMarkets:
        json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
    discNumber: json["disc_number"],
    durationMs: json["duration_ms"],
    explicit: json["explicit"],
    externalIds:
        json["external_ids"] == null
            ? null
            : ExternalIds.fromMap(json["external_ids"]),
    externalUrls:
        json["external_urls"] == null
            ? null
            : ExternalUrls.fromMap(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    isLocal: json["is_local"],
    isPlayable: json["is_playable"],
    name: json["name"],
    popularity: json["popularity"],
    previewUrl: json["preview_url"],
    trackNumber: json["track_number"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toMap() => {
    "album": album?.toMap(),
    "artists":
        artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toMap())),
    "available_markets":
        availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
    "disc_number": discNumber,
    "duration_ms": durationMs,
    "explicit": explicit,
    "external_ids": externalIds?.toMap(),
    "external_urls": externalUrls?.toMap(),
    "href": href,
    "id": id,
    "is_local": isLocal,
    "is_playable": isPlayable,
    "name": name,
    "popularity": popularity,
    "preview_url": previewUrl,
    "track_number": trackNumber,
    "type": type,
    "uri": uri,
  };
}

class ExternalIds {
  String? isrc;

  ExternalIds({this.isrc});

  factory ExternalIds.fromJson(String str) =>
      ExternalIds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExternalIds.fromMap(Map<String, dynamic> json) =>
      ExternalIds(isrc: json["isrc"]);

  Map<String, dynamic> toMap() => {"isrc": isrc};
}
