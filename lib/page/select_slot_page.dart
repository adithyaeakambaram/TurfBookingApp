import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfbookingapp/page/booking_summary.dart';

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
  String selectedperiod = "Evening";
  Set<String> selectedSlots = {};
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
          _Buildperiod(),
          _buildTimeSlots(),
          const SizedBox(height: 190),
        ],
      ),
      bottomNavigationBar: _buildBookingBar(),
    );
  }

  Widget _Buildperiod() {
    final periods = ["Twilight", "Morning", "Noon", "Evening"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: periods.map((period) {
        final isselected = selectedperiod == period;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedperiod = period;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: isselected ? Colors.green : Colors.transparent,

              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,

            child: Text(
              period,
              style: TextStyle(
                color: isselected ? Colors.white : Colors.black,

                fontSize: 15,

                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeSlots() {
    if (selectedperiod == "Twilight") {
      return _buildPeriodSlots(
        ["12am", "1am", "2am", "3am"],
        [false, false, false, false],
        ["3am", "4am", "5am", "6am"],
        [false, false, false, false],
      );
    }

    if (selectedperiod == "Morning") {
      return _buildPeriodSlots(
        ["6am", "7am", "8am", "9am"],
        [false, false, false, false],
        ["9am", "10am", "11am", "12pm"],
        [true, true, true, true],
      );
    }

    if (selectedperiod == "Noon") {
      return _buildPeriodSlots(
        ["12pm", "1pm", "2pm", "3pm"],
        [true, true, true, true],
        ["3pm", "4pm", "5pm", "6pm"],
        [true, true, false, false],
      );
    }

    // Evening
    return _buildPeriodSlots(
      ["6pm", "7pm", "8pm", "9pm"],
      [false, false, false, false],
      ["9pm", "10pm", "11pm", "12am"],
      [true, true, true, true],
    );
  }

  Widget _buildTimeRow(List<String> times) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: times.map((time) {
          return Text(
            time,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPeriodSlots(
    List<String> firstTimes,
    List<bool> firstAvailable,
    List<String> secondTimes,
    List<bool> secondAvailable,
  ) {
    return Column(
      children: [
        // FIRST TIME ROW
        _buildTimeRow(firstTimes),

        const SizedBox(height: 8),

        // FIRST SLOT BAR
        _buildSlotBar(firstTimes, firstAvailable),
        const SizedBox(height: 25),

        // SECOND TIME ROW
        _buildTimeRow(secondTimes),

        const SizedBox(height: 8),

        // SECOND SLOT BAR
        _buildSlotBar(secondTimes, secondAvailable),
      ],
    );
  }

  Widget _buildBookingBar() {
    if (selectedSlots.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 40,
      width: double.infinity,

      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingSummary()),
          );
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 0,

          padding: const EdgeInsets.symmetric(horizontal: 14),

          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),

        child: Row(
          children: [
            // PRICE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Row(
                    children: [
                      const Text(
                        "₹1,000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 7),

                      const Text(
                        "₹1,200",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    // "${_getSelectedTimeRange()} • "
                    "${selectedSlots.length} Slots",

                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ],
              ),
            ),

            // PROCEED
            const Text(
              "PROCEED",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 4),

            const Icon(Icons.arrow_forward, color: Colors.white, size: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotBar(List<String> times, List<bool> available) {
    return Container(
      height: 45,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(25),
      ),

      clipBehavior: Clip.hardEdge,

      child: Row(
        children: List.generate(available.length, (index) {
          final time = times[index];

          final isAvailable = available[index];

          final isSelected = selectedSlots.contains(time);

          return Expanded(
            child: GestureDetector(
              onTap: isAvailable
                  ? () {
                      setState(() {
                        if (selectedSlots.contains(time)) {
                          selectedSlots.remove(time);
                        } else {
                          selectedSlots.add(time);
                        }
                      });
                    }
                  : null,

              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.white,

                  border: Border(
                    right: BorderSide(
                      color: Colors.green,
                      width: index == available.length - 1 ? 0 : 1,
                    ),
                  ),
                ),

                child: isAvailable
                    ? null
                    : CustomPaint(painter: DiagonalStripePainter()),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class DiagonalStripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 7;

    for (double x = -size.height; x < size.width; x += 15) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x + size.height, 0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
