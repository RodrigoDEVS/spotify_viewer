import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_viewer/data/models/music_search_response.dart';
import 'package:spotify_viewer/domain/usecases/music_usecases.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MusicUsecases musicUsecase;
  SearchBloc({required this.musicUsecase}) : super(SearchInitial()) {
    on<SearchMusicEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        final response = await musicUsecase.musicSearch(query: event.query);
        emit(SearchLoaded(response));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
    on<SearchMusicClearEvent>((event, emit) {
      emit(SearchInitial());
    });
  }
}
