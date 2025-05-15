import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in_screen.dart';
import 'reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isEmailValid = true;
  final TextEditingController _emailController = TextEditingController();

  // Validate email
  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000), // Black
              Color(0xFF4F4F4F), // Dark Gray
              Color(0xFF000000), // Black
              Color(0xFF4F4F4F), // Dark Gray
              Color(0xFF000000), // Black
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
                      const SizedBox(height: 8),
                      Text(
                        'Forgot Password',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Provide your email address, and you will receive a link to reset your password.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Email Label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // Email Input
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'Enter your email',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.grey),
                      ),
                      errorText: _isEmailValid ? null : 'Please enter a valid email address.',
                      errorStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.red),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Continue Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEmailValid = _validateEmail(_emailController.text);
                    });

                    if (_isEmailValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'A reset link has been sent to your email.',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Back to Sign In
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInScreen()),
                    );
                  },
                  child: Text(
                    'Back to Sign In',
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

