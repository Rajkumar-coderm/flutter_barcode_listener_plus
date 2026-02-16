import 'dart:async';

class BarcodeController {
  final _controller = StreamController<String>.broadcast();

  Stream<String> get stream => _controller.stream;

  void emit(String value) {
    _controller.add(value);
  }

  void dispose() {
    _controller.close();
  }
}
