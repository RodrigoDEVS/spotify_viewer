import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/dashboard/page_view_navigation_cubit.dart';

class DashboardPageView extends StatelessWidget {
  const DashboardPageView({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PageViewNavigationCubit, PageViewNavigationState>(
      listener: (context, state) {
        if (state is PageViewNavigationChanged) {
          _pageController.animateToPage(
            state.pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: PageView(
        controller: _pageController,
        onPageChanged:
            (value) =>
                context.read<PageViewNavigationCubit>().changePage(value),
        children: [
          Center(child: Text("Inicio")),
          Center(child: Text("Buscar")),
          Center(child: Text("Biblioteca")),
        ],
      ),
    );
  }
}
