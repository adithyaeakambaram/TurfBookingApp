import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  List<String> menuitems = [
    "Account",
    "Your Booking",
    "Refunds",
    "Favourite Venues",
    "Support",
    "Privacy Policy",
    "Terms of use",
    "Logout",
  ];
  List<IconData> menuicons = [
    Icons.account_circle_outlined,
    Icons.event_note_outlined,
    Icons.currency_exchange_outlined,
    Icons.bookmark_border,
    Icons.headset_mic_outlined,
    Icons.lock_outline,
    Icons.shield_outlined,
    Icons.logout,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 120,
                  width: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage("Images/Mask group.png"),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: Text(
                        "ADITHYA",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: .bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text(
                      "eadithya2001@gmail.com",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuitems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 20),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        menuicons[index],
                        color: index == 7 ? Colors.red : Colors.green,
                        size: 39,
                      ),
                      title: Text(
                        menuitems[index],
                        style: TextStyle(
                          color: index == 7 ? Colors.red : Colors.green,
                          fontSize: 20,
                          fontWeight: .bold,
                        ),
                      ),
                    ),
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
