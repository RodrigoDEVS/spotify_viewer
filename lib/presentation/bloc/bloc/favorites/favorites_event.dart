part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

final class LoadFavoritesEvent extends FavoritesEvent {}

final class AddFavoriteEvent extends FavoritesEvent {
  final String trackId;
  AddFavoriteEvent({required this.trackId});
}
