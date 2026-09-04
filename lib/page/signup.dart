import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/CustomTextField.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Text(
                "Sign in",
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              const SizedBox(height: 20),
              Customtextfield(hinText: "UserName", icon: Icons.person),
              const SizedBox(height: 20),
              Customtextfield(hinText: "EmailId", icon: Icons.email),
              const SizedBox(height: 20),
              Customtextfield(
                hinText: "Contact Number",
                icon: Icons.contact_phone,
              ),
              const SizedBox(height: 20),
              Customtextfield(hinText: "New Password", icon: Icons.password),
              const SizedBox(height: 20),
              Customtextfield(hinText: "ConfirmPassword", icon: Icons.password),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign-Up "),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  fixedSize: Size(320, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    Text(
                      "Don,t have a account ? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text("Sign Up", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Other Way To Sign-in",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Image.asset("Images/Group 10.png", fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
