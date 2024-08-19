import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/check_box.dart';
import '../widgets/custom_back_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width:60,
              height:40,
              padding:
                  const EdgeInsets.only(left:5, right:5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Color.fromARGB(255, 54, 104, 255), width: 2),
              ),
              child: Center(
                child: Text(
                  'ECOM',
                  style: GoogleFonts.caveatBrush(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 54, 104, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(width:6)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.0),
              // Create your account text
              Text(
                'Create your account',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Name',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(111, 111, 111, 1),
                    height: 49.85 / 16.0,
                    letterSpacing: 2 / 100 * 16.0,
                  ),
                ),
              ),
        
              TextField(
                decoration: InputDecoration(
                  hintText: 'ex: Jon Smith',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(111, 111, 111, 1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
        
              // Name input
              Text(
                'Email',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(111, 111, 111, 1),
                    height: 49.85 / 16.0,
                    letterSpacing: 2 / 100 * 16.0,
                  ),
                ),
              ),
        
              TextField(
                decoration: InputDecoration(
                  hintText: 'ex: jon.smith@email.com',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(111, 111, 111, 1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
        
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(111, 111, 111, 1),
                    height: 49.85 / 16.0,
                    letterSpacing: 2 / 100 * 16.0,
                  ),
                ),
              ),
        
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(111, 111, 111, 1),
                    ),
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            
        
              Text(
                'Confirm Password',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(111, 111, 111, 1),
                    height: 49.85 / 16.0,
                    letterSpacing: 2 / 100 * 16.0,
                  ),
                ),
              ),
        
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(111, 111, 111, 1),
                    ),
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              // Terms and policy checkbox
              Row(
                children: [
                  CheckboxWidget(),
                  RichText(
                    text: TextSpan(
                      text: 'I understood the ',
                      style: GoogleFonts.poppins(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'terms & policy.',
                          style: TextStyle(
                            color: Color.fromARGB(255, 54, 104, 255),
                          ),
                          recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Terms & Policy tapped');
                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Sign Up button
              ElevatedButton(
                onPressed: () {
                   Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: const Color.fromARGB(255, 54, 104, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              // Sign In text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 54, 104, 255),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
