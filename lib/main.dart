import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai_sample/features/chat/chat_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatPage(),
    );
  }
}
