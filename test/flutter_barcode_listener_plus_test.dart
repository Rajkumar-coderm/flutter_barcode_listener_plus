import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_barcode_listener_plus/flutter_barcode_listener_plus.dart';
import 'package:flutter_barcode_listener_plus/flutter_barcode_listener_plus_platform_interface.dart';
import 'package:flutter_barcode_listener_plus/flutter_barcode_listener_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBarcodeListenerPlusPlatform
    with MockPlatformInterfaceMixin
    implements FlutterBarcodeListenerPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBarcodeListenerPlusPlatform initialPlatform = FlutterBarcodeListenerPlusPlatform.instance;

  test('$MethodChannelFlutterBarcodeListenerPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBarcodeListenerPlus>());
  });

  test('getPlatformVersion', () async {
    FlutterBarcodeListenerPlus flutterBarcodeListenerPlusPlugin = FlutterBarcodeListenerPlus();
    MockFlutterBarcodeListenerPlusPlatform fakePlatform = MockFlutterBarcodeListenerPlusPlatform();
    FlutterBarcodeListenerPlusPlatform.instance = fakePlatform;

    expect(await flutterBarcodeListenerPlusPlugin.getPlatformVersion(), '42');
  });
}
