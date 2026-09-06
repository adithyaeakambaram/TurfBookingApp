import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../favorite_manager.dart';

class CustomCarouselSlider extends StatefulWidget {
  final String venueName;
  const CustomCarouselSlider({super.key, required this.venueName});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _current = 0;
  bool isFavorite = false;

  final List<String> venueImages = [
    "Images/Mask group (7).png",
    "Images/Mask group (8).png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CarouselSlider(
            items: venueImages.map((imagePath) {
              return Stack(
                children: [ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (FavoriteManager.isFavorite(widget.venueName)) {
                              FavoriteManager.removeFavorite(widget.venueName);
                            } else {
                              FavoriteManager.addFavorite(widget.venueName);
                            }
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.green,
                          size: 20,
                        ),

                      ),
                    ),
                  ),]
              );
            }).toList(),

            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              viewportFraction: 1.0,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: false,

              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),

          const SizedBox(height: 8),

          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: venueImages.asMap().entries.map((entry) {
              return Container(
                width: 7,
                height: 7,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );

  }
}
