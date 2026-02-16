import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_barcode_listener_plus_method_channel.dart';

abstract class FlutterBarcodeListenerPlusPlatform extends PlatformInterface {
  /// Constructs a FlutterBarcodeListenerPlusPlatform.
  FlutterBarcodeListenerPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBarcodeListenerPlusPlatform _instance = MethodChannelFlutterBarcodeListenerPlus();

  /// The default instance of [FlutterBarcodeListenerPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBarcodeListenerPlus].
  static FlutterBarcodeListenerPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBarcodeListenerPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterBarcodeListenerPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
