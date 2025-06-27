import 'package:flutter/foundation.dart';

/// Общий интерфейс ASR
abstract class AsrService {
  /// Захват аудио и возвращает распознанный текст.
  Future<String> recognizeFromFile(String path);
}

/// Заглушечная реализация — возвращает пустую строку
class AsrServiceStub implements AsrService {
  @override
  Future<String> recognizeFromFile(String path) async {
    debugPrint('ASR: распознаём $path');
    return ''; // TODO: подключить speech_to_text или собственную ML-модель
  }
}
