import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendshift/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _agreedToTerms = false; 

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'SpendShift',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Email
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),

                // Username
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),

                // Terms & Privacy Checkbox (centered)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,  // Center the checkbox and text
                  children: [
                    Checkbox(
                      value: _agreedToTerms,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreedToTerms = value ?? false;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                        children: [
                          const TextSpan(text: 'By signing up, you agree to the '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent,
                            ),
                            // You can add a gesture recognizer for opening terms if needed
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent,
                            ),
                            // You can add a gesture recognizer for opening privacy if needed
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Sign Up Button
                ElevatedButton(
                  onPressed: _agreedToTerms
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const SignInScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    disabledBackgroundColor: Colors.grey,
                    disabledForegroundColor: Colors.black54,
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Navigate to Login
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInScreen()),
                    );
                  },
                  child: Text(
                    'Already have an account? Sign in',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




