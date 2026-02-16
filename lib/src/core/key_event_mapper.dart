import 'package:flutter/services.dart';

String? extractCharacter(KeyEvent event) {
  if (event is! KeyDownEvent) return null;

  if (event.logicalKey == LogicalKeyboardKey.enter) {
    return '\n';
  }

  final character = event.character;

  if (character == null || character.isEmpty) {
    return null;
  }

  return character;
}
