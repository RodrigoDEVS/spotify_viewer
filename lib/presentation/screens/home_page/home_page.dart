import 'package:flutter/material.dart';
import 'package:spotify_viewer/presentation/screens/home_page/widgets/home_bottom_navigation_bar.dart';
import 'package:spotify_viewer/presentation/screens/home_page/widgets/home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: HomePageView(pageController: _pageController),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
