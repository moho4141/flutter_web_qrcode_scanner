# 📷   flutter_web_qrcode_scanner  


**Flutter Web** plugin for scanning QR codes

## 🛠️ Getting Started

Firstly you need to add this plugin `flutter_web_qrcode_scanner:1.0.0` in your [pubspec.yaml](https://flutter.dev/platform-plugins/) file.

```yaml
dependencies:
  flutter_web_qrcode_scanner:1.0.0
```
Then you need to add `<script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>`  in your `index.html` file after body tag.

```html
  <script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>
```


## 🏃 Usage



auto play example ' the video preview will start autmticaly '

```dart
 FlutterWebQrcodeScanner(
         
          stopOnFirstResult: true, //set false if you don't want to stop video preview on getting first result
          onGetResult: (result) {
           // _result = jsonDecode(result);
          },
           //width:200,
          //height:200,
```


If you want to controll starting and stopping camera you need to add CameraController attribute

```dart
CameraController _controller = CameraController(autoPlay: false);

```

the you can start and stop video preview by calling methods `startVideoStream()` and `stopVideoStream()`


```dart 
//some code
  onTap:(){
    _controller.startVideoStream();
    }

//...
  FlutterWebQrcodeScanner(
      onGetResult: (result) {
            //_result = jsonDecode(result);
         _controller.stopVideoStream();
        },
```