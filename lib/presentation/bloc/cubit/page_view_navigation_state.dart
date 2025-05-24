part of 'page_view_navigation_cubit.dart';

@immutable
sealed class PageViewNavigationState {}

final class PageViewNavigationInitial extends PageViewNavigationState {}

final class PageViewNavigationChanged extends PageViewNavigationState {
  final int pageIndex;

  PageViewNavigationChanged(this.pageIndex);
}
