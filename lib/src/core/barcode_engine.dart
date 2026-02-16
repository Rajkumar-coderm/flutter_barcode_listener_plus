typedef BarcodeScanCallback = void Function(String value);

class BarcodeEngine {
  final Duration bufferDuration;
  final int minLength;
  final List<String> terminators;
  final BarcodeScanCallback onScan;

  final StringBuffer _buffer = StringBuffer();
  DateTime? _lastCharTime;

  BarcodeEngine({
    required this.onScan,
    this.bufferDuration = const Duration(milliseconds: 100),
    this.minLength = 3,
    this.terminators = const ['\n'],
  });

  void addCharacter(String char) {
    final now = DateTime.now();

    if (_lastCharTime != null &&
        now.difference(_lastCharTime!) > bufferDuration) {
      _reset();
    }

    _lastCharTime = now;

    if (terminators.contains(char)) {
      _emit();
    } else {
      _buffer.write(char);
    }
  }

  void _emit() {
    final value = _buffer.toString();

    if (value.length >= minLength) {
      onScan(value);
    }

    _reset();
  }

  void _reset() {
    _buffer.clear();
    _lastCharTime = null;
  }

  void dispose() {
    _reset();
  }
}
