import 'package:spotify_viewer/data/api_source/music_api_source.dart';
import 'package:spotify_viewer/data/models/music_search_response.dart';
import 'package:spotify_viewer/data/repositories/music_repository.dart';

class MusicRepositoryImpl extends MusicRepository {
  final MusicApiSource musicApiSource;

  MusicRepositoryImpl(this.musicApiSource);

  @override
  Future<MusicSearchResponse> musicSearch({required String query}) async {
    return musicApiSource.musicSearch(query: query);
  }
}
