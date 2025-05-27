import 'package:spotify_viewer/data/models/music_search_response.dart';

abstract class MusicRepository {
  Future<MusicSearchResponse> musicSearch({required String query});
}
