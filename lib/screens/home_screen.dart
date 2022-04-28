import 'package:flutter/material.dart';
import 'package:gen_scan_qr_code/screens/generate_screen.dart';
import 'package:gen_scan_qr_code/screens/scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanScreen(),
                  ),
                );
              },
              child: const Text('Scan'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenerateScreen(),
                  ),
                );
              },
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}
