import 'package:spotify_viewer/data/models/favorites_response.dart';
import 'package:spotify_viewer/data/models/music_search_response.dart';

abstract class MusicRepository {
  Future<MusicSearchResponse> musicSearch({required String query});

  Future<FavoritesResponse> getFavorites();

  Future<void> addFavorite({required String trackId});
}
