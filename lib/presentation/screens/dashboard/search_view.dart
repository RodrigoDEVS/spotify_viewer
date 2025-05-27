import 'package:flutter/material.dart';
import 'package:spotify_viewer/data/api_source/music_api_source.dart';
import 'package:spotify_viewer/presentation/utils/snackbar_utils.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: TextFormField(
              onFieldSubmitted: (value) async {
                try {
                  await MusicApiSource().musicSearch(query: value);
                } catch (e) {
                  showErrorSnackbar(context, '$e');
                  return;
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 8.0),
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
