
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/back_ground_lady.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 25, 78, 239).withOpacity(0.9),
                  Color.fromARGB(255, 54, 104, 255).withOpacity(0.4),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    'ECOM',
                    style: GoogleFonts.caveatBrush(
                      fontSize: 112.89,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 54, 104, 255),
                      height: 117.41 / 112.89,
                      letterSpacing: 2 / 100 * 112.89,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'ECOMMERCE APP',
                  textAlign: TextAlign.center, // Center align the text
                  style: GoogleFonts.poppins(
                    fontSize: 35.98,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 37.42 / 35.98, // Calculated line height
                    letterSpacing: 2 / 100 * 35.98, // Calculated letter spacing
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
