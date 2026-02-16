import 'package:flutter/material.dart';
import '../core/barcode_engine.dart';
import '../controller/barcode_controller.dart';
import '../core/key_event_mapper.dart';

class BarcodeListener extends StatefulWidget {
  final Widget child;
  final Duration bufferDuration;
  final int minLength;
  final List<String> terminators;
  final void Function(String)? onScan;
  final BarcodeController? controller;

  const BarcodeListener({
    super.key,
    required this.child,
    this.bufferDuration = const Duration(milliseconds: 100),
    this.minLength = 3,
    this.terminators = const ['\n'],
    this.onScan,
    this.controller,
  });

  @override
  State<BarcodeListener> createState() => _BarcodeListenerState();
}

class _BarcodeListenerState extends State<BarcodeListener> {
  late BarcodeEngine _engine;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _engine = BarcodeEngine(
      bufferDuration: widget.bufferDuration,
      minLength: widget.minLength,
      terminators: widget.terminators,
      onScan: (value) {
        widget.onScan?.call(value);
        widget.controller?.emit(value);
      },
    );
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final char = extractCharacter(event);
    if (char != null && char.isNotEmpty) {
      _engine.addCharacter(char);
    }
    return KeyEventResult.handled;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _engine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: widget.child,
    );
  }
}
