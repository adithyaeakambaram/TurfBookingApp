import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/carouselslider.dart';
import 'package:turfbookingapp/Widgets/searchbarfield.dart';

import '../favorite_manager.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoriteManager.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: seachbarfield(hinttext: 'Search'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        favorites[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    CustomCarouselSlider(venueName: favorites[index]),

                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
