import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_view_navigation_state.dart';

class PageViewNavigationCubit extends Cubit<PageViewNavigationState> {
  PageViewNavigationCubit() : super(PageViewNavigationChanged(0));

  void changePage(int pageIndex) {
    emit(PageViewNavigationChanged(pageIndex));
  }
}
