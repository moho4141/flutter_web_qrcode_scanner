import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';
import 'package:flutter_web_qrcode_scanner_example/full_example.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Plugin Example",
      home: Scaffold(
        body: FullExample(),
      ),
    );
  }
}

class AutoScanExample extends StatefulWidget {
  const AutoScanExample({Key? key}) : super(key: key);

  @override
  State<AutoScanExample> createState() => _AutoScanExampleState();
}

class _AutoScanExampleState extends State<AutoScanExample> {
  String? _data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _data == null
            ? Container()
            : Center(
                child: Text(
                  _data!,
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
        FlutterWebQrcodeScanner(
          cameraDirection: CameraDirection.back,
          onGetResult: (result) {
            setState(() {
              _data = result;
            });
          },
          stopOnFirstResult: true,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          onError: (error) {
            // print(error.message)
          },
          onPermissionDeniedError: () {
            //show alert dialog or something
          },
        ),
      ],
    );
  }
}
