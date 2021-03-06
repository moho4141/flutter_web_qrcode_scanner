import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();
Future picImage(Function onImagePicked, {bool cover = false}) async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    var image = await pickedFile.readAsBytes();
    var _d = decodeImageFromList(image, (imge) => {});
  } else {
    if (kDebugMode) print('No image selected.');
  }
}
