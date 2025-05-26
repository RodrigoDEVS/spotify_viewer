import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/data/api_source/auth_api_source.dart';
import 'package:spotify_viewer/presentation/bloc/cubit/auth/auth_cubit.dart';
import 'package:spotify_viewer/presentation/screens/dashboard/dashboard.dart';
import 'package:spotify_viewer/presentation/screens/initial_page/initial_page.dart';
import 'package:spotify_viewer/presentation/utils/snackbar_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthApiSource authApiSource = AuthApiSource();

  @override
  void initState() {
    super.initState();
    _listenForAuthRedirect();
  }

  void _listenForAuthRedirect() {
    AppLinks().uriLinkStream.listen((Uri? uri) async {
      if (uri != null && uri.scheme == 'com.spotifyviewer') {
        final code = uri.queryParameters['code'];
        if (code != null) {
          try {
            await authApiSource.handleAuthCode(code).then((value) {
              context.read<AuthCubit>().checkAuthStatus();
            });
          } catch (e) {
            showErrorSnackbar(context, '$e');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStatus>(
      builder: (context, state) {
        if (state == AuthStatus.unknown) {
          return const Center(child: CircularProgressIndicator());
        } else if (state == AuthStatus.authenticated) {
          return const Dashboard();
        } else {
          return const InitialPage();
        }
      },
    );
  }
}
