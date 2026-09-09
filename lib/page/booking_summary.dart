import 'package:flutter/material.dart';

class BookingSummary extends StatefulWidget {
  const BookingSummary({super.key});

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  String selectedPlaying = "5 v 5";

  String selected = "2";

  List<String> playingFormats = [
    "4 v 4",
    "5 v 5",
    "6 v 6",
    "7 v 7",
    "8 v 8",
    "9 v 9",
  ];
  List<String> players = [
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
        "10",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("SKY LAND TURD ,Aynavaram "),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sep 15",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "09:00 -10:00pm",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              _gameSelector("Box Cricket"),

              const SizedBox(width: 8),

              _gameSelector("5 v 5 Pitches"),
            ],
          ),
          const SizedBox(height: 20),
          Divider(height: 1.5),
          Text(
            "Bill Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Slot cost", style: TextStyle(color: Colors.black)),
              Text("1200", style: TextStyle(color: Colors.black)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Venue offer", style: TextStyle(color: Colors.black)),
              Text("-200", style: TextStyle(color: Colors.black)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Servie fee", style: TextStyle(color: Colors.black)),
              Text("20", style: TextStyle(color: Colors.black)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Totall", style: TextStyle(color: Colors.black)),
              Text("1020", style: TextStyle(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 20),
          Divider(height: 1.5),
          Text(
            "Payment options",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Text("Advance", style: TextStyle(color: Colors.black)),
                    SizedBox(height: 30),
                    Text("Rs,200", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Text("Advance", style: TextStyle(color: Colors.black)),
                    SizedBox(height: 30),
                    Text("Rs,1020", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(height: 1.5),
          Text(
            "what will you be playing?",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Text(
            "What will you be playing?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: playingFormats.length,
              itemBuilder: (context, index) {
                final format = playingFormats[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _playingSelector(format),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "How Many Players",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: players.length,
              itemBuilder: (context, index) {
                final format = players[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _playingplayerSelector(format),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Divider(height: 1.4),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cancellation Policy",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 14),

                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13, color: Colors.black),
                      children: [
                        TextSpan(text: "Cancel before "),
                        TextSpan(
                          text: "15th Sep, 4:00 pm",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              " to avail a refund.\n"
                              "Service fee is non-refundable.",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "If you cancel after the above time, you will lose the\n"
                    "entire amount paid,",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===============================
          // BOTTOM PAYMENT BAR
          // ===============================
          Container(
            height: 48,
            decoration: const BoxDecoration(color: Color(0xFF00C878)),
            child: Row(
              children: [
                // Amount
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Full Amount",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                        Text(
                          "₹1,020",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            height: 0.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Proceed
                const Text(
                  "PROCEED TO PAY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 8),

                const Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _playingSelector(String title) {
    final isSelected = selectedPlaying == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlaying = title;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,

          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,

            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _playingplayerSelector(String title) {
    final isSelected = selected == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = title;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,

          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,

            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _gameSelector(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
