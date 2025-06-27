import 'package:flutter/material.dart';
import 'services.dart'; // или более явные пути

void main() {
  // Замените Stub-реализации на реальные имплементации
  final asr = AsrServiceStub();
  final nlp = NlpServiceStub();
  final tts = TtsServiceStub();
  final dm  = DialogueManager(asr: asr, nlp: nlp, tts: tts);

  runApp(MyApp(dialogueManager: dm));
}

class MyApp extends StatelessWidget {
  final DialogueManager dialogueManager;
  const MyApp({required this.dialogueManager, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(dialogueManager: dialogueManager),
    );
  }
}

class HomePage extends StatelessWidget {
  final DialogueManager dialogueManager;
  const HomePage({required this.dialogueManager, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Voice Assistant')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // TODO: собирать аудио, сохранять во временный файл
            final audioPath = '/path/to/temp.wav';
            final replyFile = await dialogueManager.processAudio(audioPath);
            // TODO: воспроизвести replyFile
          },
          child: Text('Говорить'),
        ),
      ),
    );
  }
}
