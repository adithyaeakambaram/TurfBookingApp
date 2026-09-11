// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:turfbookingapp/Widgets/carouselslider.dart';
// import 'package:turfbookingapp/Widgets/searchbarfield.dart';
//
// import '../Widgets/bottomnavbar.dart';
// import 'All_Turf_Page.dart';
// import 'favorite_page.dart';
//
// class Turfhomepage extends StatefulWidget {
//   const Turfhomepage({super.key});
//
//   @override
//   State<Turfhomepage> createState() => _TurfhomepageState();
// }
//
// class _TurfhomepageState extends State<Turfhomepage> {
//   int selectedBottomIndex = 0;
//   DateTime selectedDate = DateTime.now();
//   String selectedSport = "All Sports";
//   Future<void> selectDate() async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2030),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }
//
//   String formatDate(DateTime date) {
//     const months = [
//       "Jan",
//       "Feb",
//       "Mar",
//       "Apr",
//       "May",
//       "Jun",
//       "Jul",
//       "Aug",
//       "Sep",
//       "Oct",
//       "Nov",
//       "Dec",
//     ];
//
//     return "${date.day} ${months[date.month - 1]}";
//   }
//
//   final List<Map<String, dynamic>> sports = const [
//     {"name": "Football", "image": "Images/Mask group.png"},
//     {"name": "Cricket", "image": "Images/Mask group (1).png"},
//     {"name": "Basketball", "image": "Images/Mask group (2).png"},
//     {"name": "Swimming", "image": "Images/Mask group (3).png"},
//   ];
//   final List<String> sportsFilter = const [
//     "All Sports",
//     "Cricket",
//     "Football",
//     "Basketball",
//     "Swimming",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Your Location",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text("welcomeback", style: TextStyle(color: Colors.black)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(children: [Icon(Icons.location_on), Text("kilpauk")]),
//                     Text("adithya", style: TextStyle(color: Colors.black)),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: seachbarfield(hinttext: 'Search'),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: 390,
//                   child: Image.asset("Images/Group 20.png", fit: BoxFit.cover),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 320),
//                   child: Text(
//                     "Sports",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SizedBox(
//                     height: 120,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: sports.length,
//                       itemBuilder: (context, index) {
//                         final sport = sports[index];
//                         return Container(
//                           width: 100,
//                           margin: EdgeInsets.only(right: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 120,
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.only(
//                                     bottomLeft: Radius.circular(8),
//                                     bottomRight: Radius.circular(8),
//                                   ),
//                                   child: Image.asset(
//                                     sport["image"],
//                                     width: 95,
//                                     height: 100,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 220),
//                   child: Text(
//                     "Availables venues",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: selectDate,
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 5, right: 8),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.deepOrange,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           children: [
//                             Text(
//                               formatDate(selectedDate),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             const Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     Expanded(
//                       child: SizedBox(
//                         height: 35,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: sportsFilter.length,
//                           itemBuilder: (context, index) {
//                             final sport = sportsFilter[index];
//
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedSport = sport;
//                                 });
//
//                                 {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => AllTurfPage(
//                                         selectedDate: selectedDate,
//                                         selectedSport: sport,
//                                         sportsFilter: sportsFilter,
//                                       ),
//                                     ),
//                                   );
//                                 }
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.only(right: 8),
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                   vertical: 8,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: selectedSport == sport
//                                       ? Colors.green
//                                       : Colors.white,
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                                 child: Text(
//                                   sport,
//                                   style: TextStyle(
//                                     color: selectedSport == sport
//                                         ? Colors.white
//                                         : Colors.grey,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 250),
//                   child: Text(
//                     "Hotful Spr City",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 const CustomCarouselSlider(venueName: 'Hotful Spr City'),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 230),
//                   child: Text(
//                     "Hotful Spr City"",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//
//                 const CustomCarouselSlider(venueName: 'Hotful Vivra mall'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/searchbarfield.dart';
import 'package:turfbookingapp/page/carousel_turf_card.dart';

class Turfhomepage extends StatefulWidget {
  const Turfhomepage({super.key});

  @override
  State<Turfhomepage> createState() => _TurfhomepageState();
}

class _TurfhomepageState extends State<Turfhomepage> {
  final List<Map<String, dynamic>> turfList = [
    {
      "s": "Hotfut SPR City",
      "location": "Sholinganallur Road, Perumbakkam",
      "images": ["Images/Mask group (7).png", "Images/Mask group (8).png"],
    },
    {
      "s": "Hotfut Vivira Mall",
      "location": "OMR Road, Navalur",
      "images": ["Images/Mask group (9).png", "Images/Mask group (10).png"],
    },
  ];
  final List<Map<String, dynamic>> turfs = [
    {
      "name": "Hotfut SPR City",
      "location": "Sholinganallur Road, Perumbakkam",
      "images": ["Images/Mask group (7).png", "Images/Mask group (8).png"],
    },
    {
      "name": "Hotfut Vivira Mall",
      "location": "OMR Road, Navalur",
      "images": ["Images/Mask group (9).png", "Images/Mask group (10).png"],
    },
    {
      "name": "Play Champs Badminton",
      "location": "Medavakkam, Chennai",
      "images": ["Images/Mask group (11).png", "Images/Mask group (12).png"],
    },
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

  DateTime selecteddate = DateTime.now();
  Future<void> selectdate() async {
    final DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: selecteddate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickdate != null) {
      setState(() {
        selecteddate = pickdate;
      });
    }
  }

  int selectedindec = -1;
  final List<Map<String, dynamic>> sports = const [
    {"name": "Football", "image": "Images/Mask group.png"},
    {"name": "Cricket", "image": "Images/Mask group (1).png"},
    {"name": "Basketball", "image": "Images/Mask group (2).png"},
    {"name": "Swimming", "image": "Images/Mask group (3).png"},
  ];
  final List<String> sportsFilter = const [
    "All Sports",
    "Cricket",
    "Football",
    "Basketball",
    "Swimming",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Location", style: TextStyle(fontSize: 15)),
                Text("Welcome Back", style: TextStyle(fontSize: 15)),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 15),
                  Text(
                    "Kilpauk",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 270),
                  Text(
                    "Adithya",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            seachbarfield(hinttext: 'Search'),
            SizedBox(
              height: 125,
              child: ListView.builder(
                itemCount: sports.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final sport = sports[index];
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            // borderRadius: const BorderRadius.only(
                            //   bottomLeft: Radius.circular(8),
                            //   bottomRight: Radius.circular(8),
                            // ),
                            child: Image.asset(
                              sport["image"],
                              fit: BoxFit.cover,
                              width: 95,
                              height: 120,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: selectdate,
                  child: Container(
                    height: 45,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(formatDate(selecteddate)),

                        Icon(Icons.arrow_circle_down),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sportsFilter.length,
                      itemBuilder: (context, index) {
                        final sport = sportsFilter[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedindec = index;
                            });
                          },
                          child: Container(
                            width: 90,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: selectedindec == index
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Center(child: Text(sport)),
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
                itemCount: turfList.length,
                itemBuilder: (context, index) {
                  final turfs = turfList[index];
                  return CarouselTurfCard(
                    name: turfs["s"],
                    address: turfs["location"],
                    images: ["images"],
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
