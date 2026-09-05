import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  final int currentindex;
  final Function(int) ontap;
  const Bottomnavbar({
    super.key,
    required this.currentindex,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            label: "Home",
            index: 0,
          ),

          // Turf
          _buildItem(
            icon: Icons.sports_soccer_outlined,
            selectedIcon: Icons.sports_soccer,
            label: "Turf",
            index: 1,
          ),

          // Booking
          _buildItem(
            icon: Icons.menu_book_outlined,
            selectedIcon: Icons.menu_book,
            label: "Booking",
            index: 2,
          ),

          // Favorites
          _buildItem(
            icon: Icons.favorite_border,
            selectedIcon: Icons.favorite,
            label: "Favorites",
            index: 3,
          ),

          // Profile
          _buildItem(
            icon: Icons.person_outline,
            selectedIcon: Icons.person,
            label: "Profile",
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int index,
  }) {
    final bool isselected = currentindex == index;

    return GestureDetector(
      onTap: () {
        ontap(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isselected ? selectedIcon : icon,
            size: 25,
            color: isselected ? Colors.green : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isselected ? FontWeight.bold : FontWeight.normal,
              color: isselected ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
