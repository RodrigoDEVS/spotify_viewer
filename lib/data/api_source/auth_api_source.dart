import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_viewer/data/local_storage/local_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthApiSource {
  static const String CLIENT_ID = 'c0789451d6c64017a8d27b44f82a56c6';
  static const String CLIENT_SECRET = '6863bb6daa114fd0a3450f0d4911aa31';
  static const String REDIRECT_URI = 'com.spotifyviewer://callback';

  // Este es el primer metodo que se llama para iniciar el flujo de autenticación
  // llama el metodo _launchSpotifyLogin que lanza la url de autenticación
  Future<void> authenticateWithSpotify() async {
    final state = _generateRandomString(16);
    final scope =
        'user-read-private user-read-email playlist-read-private streaming user-read-playback-state user-modify-playback-state';

    _launchSpotifyLogin(state: state, scope: scope);
  }

  // Una vez redirija a la aplicación con el código de autorización, se llama a este método para obtener el token de acceso
  Future<Map<String, dynamic>> handleAuthCode(String code) async {
    try {
      final response = await http.post(
        Uri.parse('https://accounts.spotify.com/api/token'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$CLIENT_ID:$CLIENT_SECRET'))}',
        },
        body: {
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': REDIRECT_URI,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await LocalStorage.saveAccessToken(
          data['access_token'],
          data['refresh_token'],
        );
        print('\x1B[33mdata: $data\x1B[0m');
        return data;
      } else {
        throw Exception('Error obteniendo el token de acceso');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> refreshToken() async {
    var refreshToken = await LocalStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception(
        'No hay token de actualización disponible, por favor autentique de nuevo.',
      );
    }
    try {
      final response = await http.post(
        Uri.parse('https://accounts.spotify.com/api/token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          'client_id': CLIENT_ID,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await LocalStorage.saveAccessToken(
          data['access_token'],
          data['refresh_token'],
        );
        print('\x1B[33mdata: $data\x1B[0m');
        return data;
      } else {
        throw Exception('Error obteniendo el token de acceso');
      }
    } catch (e) {
      rethrow;
    }
  }

  String _generateRandomString(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  // Este metodo lanza la url de autenticación de Spotify
  void _launchSpotifyLogin({
    required String state,
    required String scope,
  }) async {
    final url =
        'https://accounts.spotify.com/authorize?client_id=$CLIENT_ID&response_type=code&redirect_uri=$REDIRECT_URI&state=$state&scope=$scope';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint('No se pudo abrir la URL');
    }
  }
}
