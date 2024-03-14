import 'package:flutter/material.dart';
import 'package:google_generative_ai_sample/features/chat/chat_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Chat(
        user: user,
        messages: ref.watch(chatNotifierProvider).messages,
        onSendPressed: (text) =>
            ref.read(chatNotifierProvider.notifier).onSendPressed(text),
      ),
    );
  }
}
