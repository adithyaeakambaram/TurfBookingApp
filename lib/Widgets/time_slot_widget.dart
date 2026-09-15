import 'package:flutter/material.dart';

class TimeSlotWidget extends StatelessWidget {
  final Map<String, List<List<String>>> timings;
  final String? selectedPeriod;
  final String? selectedSlot;

  final Function(String) onPeriodSelected;
  final Function(String) onSlotSelected;

  const TimeSlotWidget({
    super.key,
    required this.timings,
    required this.selectedPeriod,
    required this.selectedSlot,
    required this.onPeriodSelected,
    required this.onSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PERIODS
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: timings.keys.length,
            itemBuilder: (context, index) {
              final period = timings.keys.elementAt(index);
              print(period);
              final bool isSelected = selectedPeriod == period;
              print(selectedPeriod);
              print(isSelected);
              return GestureDetector(
                onTap: () {
                  onPeriodSelected(period);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    period,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // SLOTS
        if (selectedPeriod != null)
          Column(
            children: [
              const SizedBox(height: 20),

              for (
                int rowIndex = 0;
                rowIndex < timings[selectedPeriod!]!.length;
                rowIndex++
              )
                Column(
                  children: [
                    // TIME
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (final time in timings[selectedPeriod!]![rowIndex])
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // SLOT BOX
                    Row(
                      children: [
                        for (
                          int slotIndex = 0;
                          slotIndex <
                              timings[selectedPeriod!]![rowIndex].length;
                          slotIndex++
                        )
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                final slot =
                                    timings[selectedPeriod!]![rowIndex][slotIndex];

                                onSlotSelected(slot);
                              },
                              child: Container(
                                height: 70,
                                margin: const EdgeInsets.only(right: 2),
                                decoration: BoxDecoration(
                                  color:
                                      selectedSlot ==
                                          timings[selectedPeriod!]![rowIndex][slotIndex]
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.transparent,

                                  border: Border.all(
                                    color:
                                        selectedSlot ==
                                            timings[selectedPeriod!]![rowIndex][slotIndex]
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
            ],
          ),
      ],
    );
  }
}
