import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';

class FullExample extends StatefulWidget {
  const FullExample({Key? key}) : super(key: key);

  @override
  _FullExampleState createState() => _FullExampleState();
}

class _FullExampleState extends State<FullExample> {
  late CameraController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(autoPlay: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
        Container(),
      ],
    );
  }
}

class Button extends StatefulWidget {
  const Button({ Key? key }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        color: Colors.white,
        
      ),
    );
  }
}