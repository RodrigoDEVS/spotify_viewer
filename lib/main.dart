import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/data/local_storage/local_storage.dart';
import 'package:spotify_viewer/presentation/theme/app_theme.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/auth/auth_cubit.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/dashboard/page_view_navigation_cubit.dart';
import 'package:spotify_viewer/presentation/screens/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initPrefs();
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
        BlocProvider(create: (context) => AuthCubit()..checkAuthStatus()),
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
