import '../asr/asr_service.dart';
import '../nlp/nlp_service.dart';
import '../tts/tts_service.dart';

/// Класс-оркестратор: связывает все три сервиса
class DialogueManager {
  final AsrService asr;
  final NlpService nlp;
  final TtsService tts;

  DialogueManager({
    required this.asr,
    required this.nlp,
    required this.tts,
  });

  /// Полный цикл: распознаём → анализируем → синтезируем и возвращаем файл
  Future<String> processAudio(String audioPath) async {
    final text = await asr.recognizeFromFile(audioPath);
    final tokens = await nlp.processText(text);
    final reply = _generateReply(tokens);
    final filePath = await tts.synthesizeToFile(reply);
    return filePath;
  }

  String _generateReply(List<String> tokens) {
    // TODO: ваша логика диалога
    if (tokens.contains('привет')) return 'Привет! Чем могу помочь?';
    return 'Я вас не совсем понял.';
  }
}
