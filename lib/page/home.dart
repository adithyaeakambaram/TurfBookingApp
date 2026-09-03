import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Turf Booking")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text(
                " GEAR UP \n A BIG GAME",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              Text(
                "Have Fun With Friends",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(height: 20),
              Image.asset(
                "Images/cricket_bro_1.png",
                height: 300,
                width: 500,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
