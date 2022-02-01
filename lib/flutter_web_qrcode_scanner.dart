import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FlutterWebQrcodeScanner extends StatefulWidget {
  const FlutterWebQrcodeScanner({Key? key}) : super(key: key);

  @override
  State<FlutterWebQrcodeScanner> createState() =>
      _FlutterWebQrcodeScannerState();
}

class _FlutterWebQrcodeScannerState extends State<FlutterWebQrcodeScanner> {
  CameraController controller = CameraController(autoPlay: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isRecording) {
            controller.stopVideoStreem();
          } else {
            controller.startVideoStreem();
          }
        },
      ),
      body: WebcamPage(
        controller: controller,
        onError: (d) {},
      ),
    );
  }
}

class WebcamPage extends StatefulWidget {
  const WebcamPage({
    Key? key,
    required this.controller,
    this.onError,
    this.onPermessionError,
    this.placeholder,
    this.stopOnFirstResult,
    this.width,
    this.height,
  }) : super(key: key);
  final CameraController controller;
  final Function? onPermessionError;
  final double? width;
  final double? height;

  ///widget displayed when video streem is not playing
  final Widget? placeholder;

  ///stop video streem on get first result
  final bool? stopOnFirstResult;

  /// *
  /// class DomException
  /// *
  /// get String? message
  /// *
  /// get String name
  final Function(DomException error)? onError;
  @override
  _WebcamPageState createState() => _WebcamPageState();
}

class _WebcamPageState extends State<WebcamPage> {
  late Widget _webcamWidget;
  late VideoElement _webcamVideoElement;

  void _cameraControllerListener() async {
    if (widget.controller.isRecording) {
      _startVideoStreem();
      setState(() {});
    } else {
      print('stop video streem ');
      await _stopVideoStreem();
    }
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_cameraControllerListener);

    _webcamVideoElement = VideoElement()
      ..style.width = "100%"
      ..style.height = "100%";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'webcamVideoElement', (int viewId) => _webcamVideoElement);
    _webcamWidget =
        HtmlElementView(key: UniqueKey(), viewType: 'webcamVideoElement');

    if (widget.controller.isRecording) {
      _startVideoStreem();
    }
  }

  _startVideoStreem() {
    if (_webcamVideoElement.srcObject?.active == null ||
        !_webcamVideoElement.srcObject!.active!) {
      window.navigator.getUserMedia(video: true).then((MediaStream stream) {
        _webcamVideoElement.srcObject = stream;
        _webcamVideoElement.setAttribute('playsinline', 'true');
        if (_webcamVideoElement.srcObject?.active != null &&
            _webcamVideoElement.srcObject!.active!) {
          _webcamVideoElement.play();
        }
      }).catchError((domError) {
        widget.controller.stopVideoStreem();
        if (domError.name == "NotAllowedError") {
          if (widget.onPermessionError != null) {
            widget.onPermessionError!();
          }
        } else {
          if (widget.onError != null) {
            widget.onError!(domError);
          }
        }
      });
    } else {
      if (_webcamVideoElement.srcObject!.active!) {
        _webcamVideoElement.play();
      }
    }
  }

  _stopVideoStreem() async {
    if (_webcamVideoElement.srcObject?.active != null) {
      _webcamVideoElement.pause();
      _webcamVideoElement.srcObject = null;

      // await Future.delayed(Duration(seconds: 1));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: widget.controller.isRecording
            ? _webcamWidget
            : widget.placeholder ?? Container(),
      );
}

class CameraController extends ChangeNotifier {
  final bool autoPlay;

  String? result;
  CameraController({this.result, this.autoPlay = true}) {
    if (autoPlay) {
      _isRecording = true;
    }
  }
  bool _isRecording = false;

  bool get isRecording => _isRecording;

  bool isPausd = false;

  void startVideoStreem() {
    if (!_isRecording) {
      _isRecording = true;
      notifyListeners();
    }
  }

  void stopVideoStreem() {
    if (_isRecording) {
      _isRecording = false;
      notifyListeners();
    }
  }
}
