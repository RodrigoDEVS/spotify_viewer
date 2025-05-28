import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/data/api_source/music_api_source.dart';
import 'package:spotify_viewer/data/local_storage/local_storage.dart';
import 'package:spotify_viewer/data/repositories/music_repository_impl.dart';
import 'package:spotify_viewer/domain/usecases/music_usecases.dart';
import 'package:spotify_viewer/presentation/bloc/bloc/favorites/favorites_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/bloc/search/search_bloc.dart';
import 'package:spotify_viewer/presentation/theme/app_theme.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/auth/auth_cubit.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/dashboard/page_view_navigation_cubit.dart';
import 'package:spotify_viewer/presentation/screens/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initPrefs();
  final musicApiSource = MusicApiSource();
  final musicRepository = MusicRepositoryImpl(musicApiSource);
  final musicUseCase = MusicUsecases(musicRepository);
  runApp(MyApp(musicUsecase: musicUseCase));
}

class MyApp extends StatelessWidget {
  final MusicUsecases musicUsecase;
  const MyApp({super.key, required this.musicUsecase});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageViewNavigationCubit>(
          create: (context) => PageViewNavigationCubit(),
        ),
        BlocProvider(create: (context) => AuthCubit()..checkAuthStatus()),
        BlocProvider(
          create: (context) => SearchBloc(musicUsecase: musicUsecase),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(musicUsecase: musicUsecase),
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
