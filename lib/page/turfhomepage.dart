import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/carouselslider.dart';
import 'package:turfbookingapp/Widgets/searchbarfield.dart';

class Turfhomepage extends StatelessWidget {
  const Turfhomepage({super.key});
  final List<Map<String, dynamic>> sports = const [
    {"name": "Football", "image": "Images/Mask group.png"},
    {"name": "Cricket", "image": "Images/Mask group (1).png"},
    {"name": "Basketball", "image": "Images/Mask group (2).png"},
    {"name": "Swimming", "image": "Images/Mask group (3).png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Location", style: TextStyle(color: Colors.black)),
                Text("welcomeback", style: TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [Icon(Icons.location_on), Text("kilpauk")]),
                Text("adithya", style: TextStyle(color: Colors.black)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: seachbarfield(hinttext: 'Search'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 390,
              child: Image.asset("Images/Group 20.png", fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Sports",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sports.length,
                  itemBuilder: (context, index) {
                    final sport = sports[index];
                    return Container(
                      width: 100,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              child: Image.asset(
                                sport["image"],
                                width: 95,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text(
                "Availables venues",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Hotful Spr City",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const CustomCarouselSlider(),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Hotful Vivra mall",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            // const CustomCarouselSlider(),
          ],
        ),
      ),
    );
  }
}
