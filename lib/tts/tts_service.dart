import 'package:flutter/foundation.dart';

abstract class TtsService {
  /// Синтезирует речь из текста и возвращает путь к аудиофайлу
  Future<String> synthesizeToFile(String text);
}

class TtsServiceStub implements TtsService {
  @override
  Future<String> synthesizeToFile(String text) async {
    debugPrint('TTS: синтезируем “$text”');
    return ''; // TODO: подключить flutter_tts или pyttsx3 через backend
  }
}
