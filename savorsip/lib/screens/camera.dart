import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
      controller!.pauseCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // Do something with the QR code data
      // You can also stop the camera if needed
      controller.pauseCamera();

      // Navigate to another screen or perform actions based on the scan data
      // For example:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherScreen(scanData.code)));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
