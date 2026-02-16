import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_barcode_listener_plus_platform_interface.dart';

/// An implementation of [FlutterBarcodeListenerPlusPlatform] that uses method channels.
class MethodChannelFlutterBarcodeListenerPlus
    extends FlutterBarcodeListenerPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_barcode_listener_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
