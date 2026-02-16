#include "include/flutter_barcode_listener_plus/flutter_barcode_listener_plus_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_barcode_listener_plus_plugin.h"

void FlutterBarcodeListenerPlusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_barcode_listener_plus::FlutterBarcodeListenerPlusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
