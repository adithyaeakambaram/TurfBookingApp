import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/bottomnavbar.dart';
import 'package:turfbookingapp/page/ProfilePage.dart';
import 'package:turfbookingapp/page/Turf_Details_page.dart';
import 'package:turfbookingapp/page/select_slot_page.dart';

import 'package:turfbookingapp/page/turfhomepage.dart';
import 'package:turfbookingapp/page/All_Turf_Page.dart';
import 'package:turfbookingapp/page/Booking_page.dart';
import 'package:turfbookingapp/page/favorite_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Turfhomepage(),
    // TurfDetailsPage(
    //   sportsFilter: const [
    //     "All Sports",
    //     "Cricket",
    //     "Football",
    //     "Basketball",
    //     "Swimming",
    //   ],
    //   selectedSport: '',
    // ),
    // 0 Home
    AllTurfPage(),

    // AllTurfPage(
    //   selectedDate: DateTime.now(),
    //   selectedSport: 'All Sports',
    //   sportsFilter: const [
    //     "All Sports",
    //     "Cricket",
    //     "Football",
    //     "Basketball",
    //     "Swimming",
    //   ],
    // ), // 1 Turf
    BookingPage(), // 2 Booking
    FavoritesPage(), // 3 Favorites
    SelectSlotPage(), // 4 Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
