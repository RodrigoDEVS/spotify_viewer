import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/dashboard/page_view_navigation_cubit.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  final PageController pageController;
  const DashboardBottomNavigationBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageViewNavigationCubit, PageViewNavigationState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is PageViewNavigationChanged) {
          currentIndex = state.pageIndex;
        }
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Biblioteca',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.green,
          onTap: (index) {
            pageController.jumpToPage(index);
          },
        );
      },
    );
  }
}
