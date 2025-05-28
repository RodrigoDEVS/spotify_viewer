import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_viewer/data/models/favorites_response.dart';
import 'package:spotify_viewer/domain/usecases/music_usecases.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final MusicUsecases musicUsecase;
  FavoritesBloc({required this.musicUsecase}) : super(FavoritesInitial()) {
    on<LoadFavoritesEvent>((event, emit) async {
      emit(FavoritesLoading());
      try {
        final response = await musicUsecase.getFavorites();
        emit(FavoritesLoaded(response));
      } catch (e) {
        emit(FavoritesError('$e'));
      }
    });

    on<AddFavoriteEvent>((event, emit) async {
      emit(FavoritesLoading());
      try {
        await musicUsecase.addFavorite(trackId: event.trackId);
        final response = await musicUsecase.getFavorites();
        emit(FavoritesLoaded(response));
      } catch (e, stack) {
        print('Error al agregar o cargar favoritos: $e');
        print(stack);
        emit(FavoritesError('$e'));
      }
    });
  }
}
