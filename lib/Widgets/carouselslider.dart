import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _current = 0;

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
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
    // return Column(
    //   children: [
    //     CarouselSlider(
    //       options: CarouselOptions(
    //         height: 150,
    //         viewportFraction: 1.0,
    //         autoPlay: true,
    //         autoPlayInterval: const Duration(seconds: 3),
    //         autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //
    //         enlargeCenterPage: false,
    //         onPageChanged: (index, reason) {
    //           setState(() {
    //             _current = index;
    //           });
    //         },
    //       ),
    //       items: venueImages.map((imagePath) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(10),
    //             child: Image.asset(
    //               imagePath,
    //               width: double.infinity,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         );
    //       }).toList(),
    //     ),
    //
    //     const SizedBox(height: 8),
    //
    //     // Dots
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: venueImages.asMap().entries.map((entry) {
    //         return Container(
    //           width: 7,
    //           height: 7,
    //           margin: const EdgeInsets.symmetric(horizontal: 3),
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: _current == entry.key
    //                 ? Colors.black
    //                 : Colors.grey.shade400,
    //           ),
    //         );
    //       }).toList(),
    //     ),
    //   ],
    // );
  }
}
