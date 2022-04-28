import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var showScanner = true;
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
      ),
      body: Center(
        child: showScanner
            ? MobileScanner(
                allowDuplicates: false,
                controller: MobileScannerController(
                  facing: CameraFacing.back,
                ),
                onDetect: (barcode, args) {
                  final code = barcode.rawValue;
                  setState(
                    () {
                      showScanner = false;
                      result = code ?? 'No data found';
                    },
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Result: $result'),
                    ElevatedButton(
                      onPressed: () => {
                        setState(
                          () => {
                            showScanner = true,
                          },
                        )
                      },
                      child: const Text('Scan again'),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
