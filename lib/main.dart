import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/presentation/app_theme.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/page_view_navigation_cubit.dart';
import 'package:spotify_viewer/presentation/screens/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageViewNavigationCubit>(
          create: (context) => PageViewNavigationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spotify Viewer',
        theme: AppTheme().getTheme(),
        home: const HomePage(),
      ),
    );
  }
}
