import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:qr_code_scanner/qr_code_scanner.dart';

late double montant;

class QrScan extends StatefulWidget {
  String? type;
  QrScan({Key? key, this.type}) : super(key: key);

  // QrScan({montant});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _montantController = TextEditingController();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Future<void> lunchCall({String? code}) async {
    code ??= result?.code;
  }

  modal() {
    return Form(
        key: _formKey,
        child: TextFormField(
          decoration: const InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              // label: Text("Entrer le montant")),
              label: Text("Montant")),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          controller: _montantController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Ce champ est requis";
            }
            return null;
          },
        ));
  }

  void _showModalSheet(String text, QRViewController controller, big,
      {titre = null}) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (builder) {
          return SizedBox(
            height: big
                ? MediaQuery.of(context).size.height / 1.5
                : MediaQuery.of(context).size.height / 3,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 50.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          controller.resumeCamera();
                        },
                        icon: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(3.0),
                          child: const Icon(
                            color: Colors.white,
                            Icons.close,
                          ),
                        )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50.0),
                  if (titre != null)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width / 30.0),
                        child: Text(
                          titre,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 17),
                        ),
                      ),
                    ),
                  Center(
                    child: Text(text),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20.0),
                ],
              ),
            ),
          );
        });
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      controller.resumeCamera();
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        controller.pauseCamera();
        result = scanData;
      });

      try {
        var data = jsonDecode(result!.code!);
        // qrpaye_scan(data);
        // mask_switch(data, controller);
      } catch (e) {}
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'L\'autorisation d\'accès à la caméra est requis',
              textAlign: TextAlign.center,
            )),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(child: _buildQrView(context)),
        Expanded(child: Text("Scanner le qr code de votre créancier"))
      ]),
    );
  }
}
