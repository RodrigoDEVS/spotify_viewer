import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_viewer/data/api_source/auth_api_source.dart';
import 'package:spotify_viewer/data/local_storage/local_storage.dart';

Future<Map<String, dynamic>> authenticatedRequest(
  Future<http.Response> Function(String token) request,
) async {
  try {
    var token = await LocalStorage.getAccessToken();
    var response = await request(token!);

    if (response.statusCode == 401) {
      // Intenta refrescar el token
      final newTokenData = await AuthApiSource().refreshToken();
      if (newTokenData['access_token'] != null) {
        await LocalStorage.saveAccessToken(
          newTokenData['access_token'],
          newTokenData['refresh_token'],
        );
        token = newTokenData['access_token'];
        response = await request(token!);
      } else {
        throw Exception('Token expirado o inválido.');
      }
    }

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    throw Exception(e.toString().replaceFirst('Exception: ', ''));
  }
}
