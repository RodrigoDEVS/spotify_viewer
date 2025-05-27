import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/dashboard/page_view_navigation_cubit.dart';
import 'package:spotify_viewer/presentation/screens/dashboard/library_view.dart';
import 'package:spotify_viewer/presentation/screens/dashboard/search_view.dart';
import 'package:spotify_viewer/presentation/screens/dashboard/suggestions_view.dart';

class DashboardPageView extends StatelessWidget {
  final PageController pageController;
  const DashboardPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PageViewNavigationCubit, PageViewNavigationState>(
      listener: (context, state) {
        if (state is PageViewNavigationChanged) {
          pageController.animateToPage(
            state.pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: PageView(
        controller: pageController,
        onPageChanged:
            (value) =>
                context.read<PageViewNavigationCubit>().changePage(value),
        children: [SuggestionsView(), SearchView(), LibraryView()],
      ),
    );
  }
}
