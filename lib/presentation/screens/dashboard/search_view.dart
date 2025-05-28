import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/data/models/music_search_response.dart';
import 'package:spotify_viewer/presentation/bloc/bloc/favorites/favorites_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/bloc/search/search_bloc.dart';

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
                context.read<SearchBloc>().add(SearchMusicEvent(value));
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
          const SizedBox(height: 8.0),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchLoaded) {
                final combinedList = [
                  ...state.musicSearchResponse.tracks?.items ?? [],
                  ...state.musicSearchResponse.albums?.items ?? [],
                  ...state.musicSearchResponse.artists?.items ?? [],
                ];
                return Expanded(
                  child: ListView.builder(
                    itemCount: combinedList.length,
                    itemBuilder: (context, index) {
                      final item = combinedList[index];
                      return item is TracksItem
                          ? ListTile(
                            title: Text(
                              item.name ?? 'Unknown Track',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              'Cancion - ${item.artists?.first.name}',
                              style: TextStyle(color: Colors.white70),
                            ),
                            leading:
                                item.album!.images!.isNotEmpty
                                    ? Image.network(
                                      item.album!.images!.first.url!,
                                    )
                                    : null,
                            trailing: InkWell(
                              onTap: () {
                                context.read<FavoritesBloc>().add(
                                  AddFavoriteEvent(trackId: item.id!),
                                );
                              },
                              child: Icon(Icons.add_circle),
                            ),
                          )
                          : item is ArtistsItem
                          ? ListTile(
                            title: Text(
                              item.name ?? 'Unknown Track',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              'Artista',
                              style: TextStyle(color: Colors.white70),
                            ),
                            leading:
                                item.images!.isNotEmpty
                                    ? Image.network(item.images!.first.url!)
                                    : null,
                          )
                          : item is AlbumElement
                          ? ListTile(
                            title: Text(
                              item.name ?? 'Unknown Item',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              'Album - ${item.artists?.first.name ?? 'Unknown Artist'}',
                              style: TextStyle(color: Colors.white70),
                            ),
                            leading:
                                item.images!.isNotEmpty
                                    ? Image.network(item.images!.first.url!)
                                    : null,
                          )
                          : ListTile(
                            title: Text('Unknown Item'),
                            subtitle: Text('No details available'),
                          );
                    },
                  ),
                );
              } else if (state is SearchError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
