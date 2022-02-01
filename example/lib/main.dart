import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';

List<CameraDescription> cameras = [];
void main() {
  return runApp(const MyApp());
}

// dynamic _jsQR(data, width, height, option) {
//   return js.context.callMethod('jsQR', [data, width, height, option]);
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FlutterWebQrcodeScanner(),
      ),
    );
  }
}
