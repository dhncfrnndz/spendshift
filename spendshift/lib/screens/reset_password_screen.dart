import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                        'Reset Password',
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
                        'This is the password you will use to Sign In to your SpendShift account.',
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

                // New Password Label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Password',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // New Password Field
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'Enter new password',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.grey),
                      ),
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
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Confirm Password Label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // Confirm Password Field
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'Confirm your new password',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Reset Password Button
                ElevatedButton(
                  onPressed: () {
                    if (_passwordController.text == _confirmPasswordController.text) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Passwords do not match.',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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

