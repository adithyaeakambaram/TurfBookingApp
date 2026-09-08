import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectSlotPage extends StatefulWidget {
  final String venueName;
  final DateTime selectedDate;
  final String selectedSport;
  const SelectSlotPage({
    super.key,
    required this.venueName,
    required this.selectedDate,
    required this.selectedSport,
  });

  @override
  State<SelectSlotPage> createState() => _SelectSlotPageState();
}

class _SelectSlotPageState extends State<SelectSlotPage> {
  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();

    selectedDate = widget.selectedDate;
  }

  String getWeekDay(DateTime date) {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return days[date.weekday - 1];
  }

  // Get date like 15 Sep
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
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("SKY LAND TURD ,Aynavaram "),
      ),
      body: Column(
        children: [
          Text("FORMAT", style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Box Cricket", style: TextStyle(color: Colors.white)),
          ),
          Text("NO OF PITCHES", style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("1", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                final date = selectedDate.add(Duration(days: index));

                final isSelected =
                    date.day == selectedDate.day &&
                    date.month == selectedDate.month &&
                    date.year == selectedDate.year;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  child: Container(
                    width: 90,

                    margin: const EdgeInsets.only(right: 16),

                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.white,

                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getWeekDay(date),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          formatDate(date),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xffd8fff0),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.local_offer_outlined,
                      size: 17,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Flatt Rs.200 off\nOn all slots",
                      style: TextStyle(fontSize: 13, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
