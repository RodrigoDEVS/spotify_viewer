import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_viewer/presentation/bloc/bloc/favorites/favorites_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoritesLoaded) {
          final items = state.favoritesResponse.items ?? [];
          if (items.isEmpty) {
            return const Center(child: Text('No tienes favoritos'));
          }
          return Column(
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final track = items[index].track;
                    return ListTile(
                      leading:
                          track!.album!.images!.isNotEmpty
                              ? Image.network(track.album!.images!.first.url!)
                              : null,
                      title: Text(
                        track.name ?? 'Sin nombre',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        track.artists?.first.name ?? '',
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is FavoritesError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text("Biblioteca"));
      },
    );
  }
}
