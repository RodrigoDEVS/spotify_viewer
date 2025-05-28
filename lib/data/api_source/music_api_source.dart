import 'package:http/http.dart' as http;
import 'package:spotify_viewer/data/api_source/authenticated_request.dart';
import 'package:spotify_viewer/data/models/favorites_response.dart';
import 'package:spotify_viewer/data/models/music_search_response.dart';

class MusicApiSource {
  static const String baseUrl = 'https://api.spotify.com';

  Future<MusicSearchResponse> musicSearch({required String query}) async {
    final data = await authenticatedRequest((token) {
      final url = Uri.parse(
        '$baseUrl/v1/search?q=$query&type=track,artist,album&limit=10',
      );
      return http.get(url, headers: {'Authorization': 'Bearer $token'});
    });
    return MusicSearchResponse.fromMap(data);
  }

  Future<FavoritesResponse> getFavorites() async {
    final data = await authenticatedRequest((token) {
      final url = Uri.parse('$baseUrl/v1/me/tracks');
      return http.get(url, headers: {'Authorization': 'Bearer $token'});
    });
    return FavoritesResponse.fromMap(data);
  }

  Future<void> addFavorite({required String trackId}) async {
    await authenticatedRequest((token) {
      final url = Uri.parse('$baseUrl/v1/me/tracks?ids=$trackId');
      return http.put(url, headers: {'Authorization': 'Bearer $token'});
    });
  }
}
