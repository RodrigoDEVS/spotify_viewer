import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/bloc/search/search_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/auth/auth_cubit.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/dashboard/page_view_navigation_cubit.dart';
import 'package:spotify_viewer/presentation/screens/dashboard/widgets/dashboard_bottom_navigation_bar.dart';
import 'package:spotify_viewer/presentation/screens/dashboard/widgets/dashboard_page_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spotify Viewer"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              context.read<PageViewNavigationCubit>().resetPage();
              context.read<SearchBloc>().add(SearchMusicClearEvent());
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: DashboardPageView(pageController: _pageController),
      bottomNavigationBar: DashboardBottomNavigationBar(
        pageController: _pageController,
      ),
    );
  }
}
