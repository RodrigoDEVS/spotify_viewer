import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AuthApiSource {
  static const String CLIENT_ID = 'efbc699a613f4c47a7b34d69084b04ae';
  static const String CLIENT_SECRET = 'fafe35bb36ee42b6ab4761cc43381ac3';
  static const String REDIRECT_URI = 'com.spotifyviewer://callback';

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

  Future<void> authenticateWithSpotify() async {
    final state = _generateRandomString(16);
    final scope =
        'user-read-private user-read-email playlist-read-private streaming user-read-playback-state user-modify-playback-state';

    _launchSpotifyLogin(state: state, scope: scope);
  }
}
