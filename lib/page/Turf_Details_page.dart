// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:turfbookingapp/page/select_slot_page.dart';
//
// class TurfDetailsPage extends StatefulWidget {
//   final List<String> sportsFilter;
//   final String selectedSport;
//   final String venueName;
//   final DateTime selectedDate;
//
//   const TurfDetailsPage({
//     super.key,
//     required this.sportsFilter,
//     required this.selectedSport,
//     required this.venueName,
//     required this.selectedDate,
//   });
//
//   @override
//   State<TurfDetailsPage> createState() => _TurfDetailsPageState();
// }
//
// class _TurfDetailsPageState extends State<TurfDetailsPage> {
//   late String selectedSport;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(Icons.arrow_back),
//                 Container(
//                   height: 34,
//                   width: 34,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(Icons.share, size: 20),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 65),
//
//           SizedBox(
//             width: double.infinity,
//             height: 182,
//             child: Image.asset("assets/images/turf.jpg", fit: BoxFit.cover),
//           ),
//
//           const SizedBox(height: 30),
//
//           SizedBox(
//             height: 60,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 4,
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: 105,
//                   margin: const EdgeInsets.only(right: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(shape: BoxShape.circle),
//                         child: Icon(
//                           Icons.local_offer_outlined,
//                           size: 14,
//                           color: Colors.green,
//                         ),
//                       ),
//
//                       const SizedBox(width: 6),
//
//                       Expanded(
//                         child: Text(
//                           "Flatt Rs.200 off\nOn all slots",
//                           style: TextStyle(
//                             fontSize: 10,
//                             height: 1.3,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(right: 290.0),
//             child: Text(
//               "Available Venues",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//
//           SizedBox(
//             height: 35,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.sportsFilter.length,
//               itemBuilder: (context, index) {
//                 final sport = widget.sportsFilter[index];
//
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedSport = sport;
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(right: 8),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: widget.selectedSport == sport
//                           ? Colors.green
//                           : Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: Text(
//                       sport,
//                       style: TextStyle(
//                         color: widget.selectedSport == sport
//                             ? Colors.white
//                             : Colors.grey,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(right: 320.0),
//             child: Text(
//               " Venue info",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 width: 80,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Pitch",
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: Text(
//                   "1.Nets",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 260.0),
//             child: Text(
//               " Equipment Provided",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 300.0),
//             child: Text(
//               " Artifical Turf",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Divider(height: 1),
//           ),
//           _amenity(Icons.account_balance_wallet_outlined, 'UPI Accepted'),
//
//           _amenity(Icons.credit_card_outlined, 'Card Accepted'),
//
//           _amenity(Icons.local_parking_outlined, 'Free Parking'),
//
//           _amenity(Icons.wc_outlined, 'Toilets'),
//
//           _amenity(Icons.shower_outlined, 'Showers'),
//
//           _amenity(Icons.shower_outlined, 'Showers'),
//
//           const SizedBox(height: 70),
//           SizedBox(
//             width: 500,
//             height: 70,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadiusGeometry.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SelectSlotPage(
//                       venueName: widget.venueName,
//                       selectedDate: widget.selectedDate,
//                       selectedSport: widget.selectedSport,
//                     ),
//                   ),
//                 );
//               },
//               child: Text(
//                 "Please Select A solot",
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _amenity(IconData icon, String tittle) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.green, size: 17),
//           const SizedBox(width: 7),
//           Text(tittle, style: TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TurfDetailsPage extends StatefulWidget {
  final List<String> images;
  // final String name;
  // final String address;
  const TurfDetailsPage({
    super.key,
    required this.images,
    // required this.name,
    // required this.address,
  });

  @override
  State<TurfDetailsPage> createState() => _TurfDetailsPageState();
}

class _TurfDetailsPageState extends State<TurfDetailsPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 90),
          Stack(
            children: [
              CarouselSlider(
                items: widget.images.map((image) {
                  return SizedBox(
                    width: 450,
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
          Text(
            "Sky Land Turf",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "AYNAVARAM",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
