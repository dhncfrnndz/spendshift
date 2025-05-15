import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  final List<String> currencies = const [
    'USD - US Dollar',
    'PHP - Philippine Peso',
    'KRW - South Korean Won',
    'EUR - Euro',
  ];

  Future<void> _saveCurrency(BuildContext context, String currency) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_currency', currency);
    // ignore: use_build_context_synchronously
    Navigator.pop(context, currency); // Pass back to settings screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Select Currency',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        itemCount: currencies.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          final currency = currencies[index];
          return ListTile(
            title: Text(
              currency,
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.white30),
            onTap: () => _saveCurrency(context, currency),
          );
        },
      ),
    );
  }
}


