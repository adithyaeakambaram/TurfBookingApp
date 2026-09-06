import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home
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
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              size: 25,
              color: isSelected
                  ? Colors.green
                  : Colors.black,
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: isSelected
                    ? Colors.green
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}