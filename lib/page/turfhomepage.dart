import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/carouselslider.dart';
import 'package:turfbookingapp/Widgets/searchbarfield.dart';

import '../Widgets/bottomnavbar.dart';
import 'All_Turf_Page.dart';
import 'favorite_page.dart';

class Turfhomepage extends StatefulWidget {
  const Turfhomepage({super.key});

  @override
  State<Turfhomepage> createState() => _TurfhomepageState();
}

class _TurfhomepageState extends State<Turfhomepage> {
  int selectedBottomIndex = 0;
  DateTime selectedDate = DateTime.now();
  String selectedSport = "All Sports";
  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String formatDate(DateTime date) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return "${date.day} ${months[date.month - 1]}";
  }
  final List<Map<String, dynamic>> sports = const [
    {"name": "Football", "image": "Images/Mask group.png"},
    {"name": "Cricket", "image": "Images/Mask group (1).png"},
    {"name": "Basketball", "image": "Images/Mask group (2).png"},
    {"name": "Swimming", "image": "Images/Mask group (3).png"},
  ];
  final List<String> sportsFilter =const  [
    "All Sports",
    "Cricket",
    "Football",
    "Basketball",
    "Swimming",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: selectDate,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              formatDate(selectedDate),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sportsFilter.length,
                          itemBuilder: (context, index) {
                            final sport = sportsFilter[index];

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSport = sport;
                                });

                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  AllTurfPage(
                                        selectedDate: selectedDate,
                                        selectedSport: sport,
                                        sportsFilter: sportsFilter,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedSport == sport
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Text(
                                  sport,
                                  style: TextStyle(
                                    color: selectedSport == sport
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
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
                const CustomCarouselSlider(venueName: 'Hotful Spr City',),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: Text(
                    "Hotful Vivra mall",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                const CustomCarouselSlider(venueName: 'Hotful Vivra mall',),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedBottomIndex,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritesPage(),
              ),
            );
          } else {
            setState(() {
              selectedBottomIndex = index;
            });
          }
        },
      ),
    );
  }
}
