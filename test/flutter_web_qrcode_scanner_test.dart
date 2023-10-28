import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_web_qrcode_scanner');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await FlutterWebQrcodeScanner.platformVersion, '42');
  // });
}
