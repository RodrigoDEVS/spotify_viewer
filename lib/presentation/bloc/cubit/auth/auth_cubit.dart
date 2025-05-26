import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/data/local_storage/local_storage.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthCubit extends Cubit<AuthStatus> {
  AuthCubit() : super(AuthStatus.unknown);

  Future<void> checkAuthStatus() async {
    final token = await LocalStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      emit(AuthStatus.authenticated);
    } else {
      emit(AuthStatus.unauthenticated);
    }
  }

  void logout() async {
    await LocalStorage.clearAccessToken();
    emit(AuthStatus.unauthenticated);
  }
}
