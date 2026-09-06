import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/carouselslider.dart';
import '../Widgets/searchbarfield.dart';

class AllTurfPage extends StatefulWidget {
  final DateTime selectedDate;
  final String selectedSport;
  final List<String> sportsFilter;

  const AllTurfPage({
    super.key,
    required this.selectedDate,
    required this.selectedSport, required this.sportsFilter,
  });

  @override
  State<AllTurfPage> createState() => _AllTurfPageState();

}

class _AllTurfPageState extends State<AllTurfPage> {
  late DateTime selectedDate;
  late String selectedSport;


  final List<String> venues = const [
    "Hotfut SPR City",
    "Hotfut Vivira Mall",
    "Play Champs Badminton",
    "Turfworld Vivira Mall",
  ];


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
            Row(
              children: [
                Container(
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
                        formatDate(widget.selectedDate),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.sportsFilter.length,
                      itemBuilder: (context, index) {
                        final sport = widget.sportsFilter[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSport = sport;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: widget.selectedSport == sport
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              sport,
                              style: TextStyle(
                                color: widget.selectedSport == sport
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
            Expanded(
              child: ListView.builder(
                itemCount: venues.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Text(
                          venues[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),

                       CustomCarouselSlider(venueName: venues[index],),

                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
