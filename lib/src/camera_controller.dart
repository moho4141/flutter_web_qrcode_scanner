import 'package:flutter/foundation.dart';

class CameraController extends ChangeNotifier {
  final bool autoPlay;

  CameraController({this.autoPlay = true}) {
    if (autoPlay) {
      _isRecording = true;
    }
  }

  bool _isRecording = false;

  bool get isRecording => _isRecording;

  void startVideoStream() {
    if (!_isRecording) {
      _isRecording = true;
      notifyListeners();
    }
  }

  void stopVideoStream() {
    if (_isRecording) {
      _isRecording = false;
      notifyListeners();
    }
  }
}
