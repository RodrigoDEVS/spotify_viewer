import 'package:flutter/material.dart';
import 'package:spotify_viewer/data/api_source/auth_api_source.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Conecta con Spotify',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AuthApiSource().authenticateWithSpotify();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Iniciar Sesión con Spotify'),
            ),
          ],
        ),
      ),
    );
  }
}
