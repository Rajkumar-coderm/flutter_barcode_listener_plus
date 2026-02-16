
import 'flutter_barcode_listener_plus_platform_interface.dart';

class FlutterBarcodeListenerPlus {
  Future<String?> getPlatformVersion() {
    return FlutterBarcodeListenerPlusPlatform.instance.getPlatformVersion();
  }
}
