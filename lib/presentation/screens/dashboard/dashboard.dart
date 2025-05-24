import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text("Spotify Viewer")),
      body: DashboardPageView(pageController: _pageController),
      bottomNavigationBar: DashboardBottomNavigationBar(),
    );
  }
}
