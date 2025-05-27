part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchMusicEvent extends SearchEvent {
  final String query;

  SearchMusicEvent(this.query);
}

final class SearchMusicClearEvent extends SearchEvent {
  SearchMusicClearEvent();
}
