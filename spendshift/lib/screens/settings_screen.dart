import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'currency_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedCurrency = 'Not set';

  @override
  void initState() {
    super.initState();
    _loadCurrency();
  }

  Future<void> _loadCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs.getString('selected_currency') ?? 'Not set';
    });
  }

  void _navigateToCurrency() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CurrencyScreen()),
    );
    if (result != null) {
      setState(() {
        selectedCurrency = result;
      });
    }
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    'Settings',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Currency Setting
                ListTile(
                  leading: const Icon(Icons.attach_money, color: Colors.white),
                  title: Text(
                    'Currency',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  ),
                  subtitle: Text(
                    selectedCurrency,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
                  onTap: _navigateToCurrency,
                ),
                const Divider(color: Colors.white24),

                // Language Setting (Placeholder)
                _buildSimpleSetting(Icons.language, 'Language'),

                // Security Setting (Placeholder)
                _buildSimpleSetting(Icons.security, 'Security'),

                // About Setting (Placeholder)
                _buildSimpleSetting(Icons.info_outline, 'About'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleSetting(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title tapped')),
            );
          },
        ),
        const Divider(color: Colors.white24),
      ],
    );
  }
}
