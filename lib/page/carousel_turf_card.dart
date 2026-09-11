import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselTurfCard extends StatefulWidget {
  final String name;
  final String address;
  final List<String> images;
  const CarouselTurfCard({
    super.key,
    required this.name,
    required this.address,
    required this.images,
  });

  @override
  State<CarouselTurfCard> createState() => _CarouselTurfCardState();
}

class _CarouselTurfCardState extends State<CarouselTurfCard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.address,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Stack(
          children: [
            CarouselSlider(
              items: widget.images.map((image) {
                return SizedBox(
                  width: 350,
                  child: ClipRRect(
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.favorite_border, color: Colors.green),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: currentIndex == index ? 10 : 7,
                    height: currentIndex == index ? 10 : 7,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.green
                          : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
