import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatefulWidget {
  final String myUserID;
  const QRScanScreen({super.key, required this.myUserID});

  @override
  State<StatefulWidget> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });

      String currentUserID = widget.myUserID;
      String? targetUserID = scanData.code;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(targetUserID)
          .collection('pendingRequests')
          .doc(currentUserID)
          .set({'uid': currentUserID});

      print('Friend request sent to $targetUserID from $currentUserID');

      // Return to the previous page after processing the scan result
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
