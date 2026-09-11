// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:turfbookingapp/page/Turf_Details_page.dart';
//
// import '../Widgets/carouselslider.dart';
// import '../Widgets/searchbarfield.dart';
//
// class AllTurfPage extends StatefulWidget {
//   final DateTime selectedDate;
//   final String selectedSport;
//   final List<String> sportsFilter;
//
//   const AllTurfPage({
//     super.key,
//     required this.selectedDate,
//     required this.selectedSport,
//     required this.sportsFilter,
//   });
//
//   @override
//   State<AllTurfPage> createState() => _AllTurfPageState();
// }
//
// class _AllTurfPageState extends State<AllTurfPage> {
//   late DateTime selectedDate;
//   late String selectedSport;
//
//   final List<String> venues = const [
//     "Hotfut SPR City",
//     "Hotfut Vivira Mall",
//     "Play Champs Badminton",
//     "Turfworld Vivira Mall",
//   ];
//   @override
//   void initState() {
//     super.initState();
//
//     selectedDate = widget.selectedDate;
//     selectedSport = widget.selectedSport;
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Your Location", style: TextStyle(color: Colors.black)),
//                 Text("welcomeback", style: TextStyle(color: Colors.black)),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(children: [Icon(Icons.location_on), Text("kilpauk")]),
//                 Text("adithya", style: TextStyle(color: Colors.black)),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: seachbarfield(hinttext: 'Search'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 220),
//               child: Text(
//                 "Availables venues",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 5, right: 8),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.deepOrange,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         formatDate(widget.selectedDate),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const Icon(
//                         Icons.keyboard_arrow_down,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 Expanded(
//                   child: SizedBox(
//                     height: 35,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.sportsFilter.length,
//                       itemBuilder: (context, index) {
//                         final sport = widget.sportsFilter[index];
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedSport = sport;
//                             });
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 8),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               color: widget.selectedSport == sport
//                                   ? Colors.green
//                                   : Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(color: Colors.grey),
//                             ),
//                             child: Text(
//                               sport,
//                               style: TextStyle(
//                                 color: widget.selectedSport == sport
//                                     ? Colors.white
//                                     : Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: venues.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15,
//                           vertical: 8,
//                         ),
//                         child: Text(
//                           venues[index],
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => TurfDetailsPage(
//                                 // ✅ Selected turf
//                                 venueName: venues[index],
//
//                                 // ✅ Selected date
//                                 selectedDate: selectedDate,
//
//                                 // ✅ Selected sport
//                                 selectedSport: selectedSport,
//
//                                 // ✅ Pass complete sports list
//                                 sportsFilter: widget.sportsFilter,
//                               ),
//                             ),
//                           );
//                         },
//
//                         child: CustomCarouselSlider(venueName: venues[index]),
//                       ),
//
//                       const SizedBox(height: 10),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/searchbarfield.dart';
import 'package:turfbookingapp/page/Turf_Details_page.dart';
import 'package:turfbookingapp/page/carousel_turf_card.dart';

class AllTurfPage extends StatefulWidget {
  const AllTurfPage({super.key});

  @override
  State<AllTurfPage> createState() => _AllTurfPageState();
}

class _AllTurfPageState extends State<AllTurfPage> {
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
  final List<String> sportsFilter = const [
    "All Sports",
    "Cricket",
    "Football",
    "Basketball",
    "Swimming",
  ];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Text(
                "Your Location",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(width: 200),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on),
              Text(
                "kilpauk",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 230),
              Text(
                "Adithya",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          seachbarfield(hinttext: 'Search'),
          SizedBox(height: 30),
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

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TurfDetailsPage(
                          images: List<String>.from(turfs["images"]),
                          // name: turfs["s"],
                          // address: turfs["location"],
                        ),
                      ),
                    );
                  },
                  child: CarouselTurfCard(
                    name: turfs["s"],
                    address: turfs["location"],
                    images: List<String>.from(turfs["images"]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
