import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendshift/screens/sign_up_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignUpScreen()), 
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000), 
              Color(0xFF4F4F4F), 
              Color(0xFF000000), 
              Color(0xFF4F4F4F), 
              Color(0xFF000000), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 150, height: 150),
              const SizedBox(height: 30),
              Text(
                'SpendShift',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

