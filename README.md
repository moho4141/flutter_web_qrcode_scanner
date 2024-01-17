# 📷   flutter_web_qrcode_scanner  


**Flutter Web** plugin for scanning QR codes

## 🛠️ Getting Started

Firstly you need to add this plugin `flutter_web_qrcode_scanner:1.0.3` to your [pubspec.yaml](https://flutter.dev/platform-plugins/) file.

```yaml
dependencies:
  flutter_web_qrcode_scanner:1.0.3
```
Then you need to add `<script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>`  to your `index.html` file after body tag.

```html
  <script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>
```


## 🏃 Usage



Auto play example, The video preview (scanning area) will start automatically

```dart
 FlutterWebQrcodeScanner(
    cameraDirection: CameraDirection.back,
    stopOnFirstResult: true, //set false if you don't want to stop video preview on getting first result
    onGetResult: (result) {
           // _result = jsonDecode(result);
    },
    //width:200,
    //height:200,
 )
```

You are able to choose the scanning camera via the cameraDirection attribute `CameraDirection.back`  or `CameraDirection.front`,

If you want to control the start and stop of camera scanning, you must use the CameraController attribute

```dart
CameraController _controller = CameraController(autoPlay: false);

```

then you can start and stop video preview by calling methods `startVideoStream()` and `stopVideoStream()`


```dart 

InkWell(
  //some code
  onTap:(){
    _controller.startVideoStream();
    },
)
.
.
.
FlutterWebQrcodeScanner(
  controller: _controller,
  onGetResult: (result) {
            // some code
         _controller.stopVideoStream();
      },
    )
```