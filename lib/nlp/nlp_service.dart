import 'package:flutter/foundation.dart';

/// Интерфейс NLP-сервиса
abstract class NlpService {
  /// Принимает сырой текст, возвращает список лемм или intent/data
  Future<List<String>> processText(String text);
}

class NlpServiceStub implements NlpService {
  @override
  Future<List<String>> processText(String text) async {
    debugPrint('NLP: анализируем “$text”');
    return text.split(RegExp(r'\s+')); // простая токенизация
  }
}
