import 'package:spotify_viewer/data/models/favorites_response.dart';
import 'package:spotify_viewer/data/models/music_search_response.dart';
import 'package:spotify_viewer/data/repositories/music_repository.dart';

class MusicUsecases {
  final MusicRepository musicRepository;
  MusicUsecases(this.musicRepository);

  Future<MusicSearchResponse> musicSearch({required String query}) async {
    return musicRepository.musicSearch(query: query);
  }

  Future<FavoritesResponse> getFavorites() async {
    return musicRepository.getFavorites();
  }

  Future<void> addFavorite({required String trackId}) async {
    return musicRepository.addFavorite(trackId: trackId);
  }
}
