import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  bool _isPinSet = false;
  String? _storedPin;

  @override
  void initState() {
    super.initState();
    _checkPinStatus();
  }

  Future<void> _checkPinStatus() async {
    // Check if a PIN is already set
    _storedPin = await _secureStorage.read(key: 'pin');
    setState(() {
      _isPinSet = _storedPin != null;
    });
  }

  // Handle Face ID Authentication
  Future<void> _authenticateWithFaceID() async {
    try {
      bool isBiometricAvailable = await _localAuth.canCheckBiometrics;
      if (isBiometricAvailable) {
        bool authenticated = await _localAuth.authenticate(
          localizedReason: 'Please authenticate to proceed',
          options: const AuthenticationOptions(biometricOnly: true),
        );

        if (authenticated) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Face ID authentication successful!')),
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Authentication failed')));
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Biometric authentication not available')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during authentication: $e')),
        );
      }
    }
  }

  // Show PIN dialog to input PIN
  Future<String?> _showPinDialog(String title) {
    TextEditingController pinController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: pinController,
            obscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 4,
            decoration: InputDecoration(hintText: 'Enter 4-digit PIN'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(pinController.text);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Handle PIN Setup or Verification
  Future<void> _setupPin() async {
    String? pin = await _showPinDialog(
      _isPinSet ? 'Enter your PIN' : 'Set your new PIN',
    );

    if (pin != null) {
      if (_isPinSet) {
        // If PIN is already set, verify the entered PIN
        if (pin == _storedPin) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('PIN authentication successful!')),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Incorrect PIN')));
        }
      } else {
        // If no PIN is set, store the new PIN
        await _secureStorage.write(key: 'pin', value: pin);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('PIN set successfully!')));
        setState(() {
          _isPinSet = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Security',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF4F4F4F), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // PIN Setup or Verification
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: _setupPin,
                  child: Text(
                    _isPinSet ? 'Verify PIN' : 'Set a PIN',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Face ID Authentication
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: _authenticateWithFaceID,
                  child: Text(
                    'Unlock with Face ID',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
