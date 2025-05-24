import 'package:flutter/material.dart';
import 'package:spotify_viewer/presentation/app_theme.dart';
import 'package:spotify_viewer/presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Viewer',
      theme: AppTheme().getTheme(),
      home: const HomePage(),
    );
  }
}
