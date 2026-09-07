import 'package:flutter/material.dart';
import 'package:turfbookingapp/Widgets/CustomTextField.dart';
import 'package:turfbookingapp/page/Foregtpassword.dart';
import 'package:turfbookingapp/page/signup.dart';
import 'package:turfbookingapp/page/turfhomepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              Text(
                "Have Fun with Friends!",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(height: 30),
              Customtextfield(hinText: "UserName", icon: Icons.person),
              const SizedBox(height: 30),
              Customtextfield(hinText: "UserName", icon: Icons.lock),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgetpassword()),
                    );
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Turfhomepage()),
                  );
                },
                child: Text("Login", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  fixedSize: Size(320, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    Text(
                      "Don,t Have Acoount ? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Other Way to Sign-in",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30),
              Image.asset("Images/Group 10.png", fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
