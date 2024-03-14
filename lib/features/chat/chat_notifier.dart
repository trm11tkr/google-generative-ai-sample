import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_generative_ai_sample/data/api/provider/generative_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_notifier.g.dart';

const ai = User(id: 'gemini');
const user = User(id: 'user');

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  ({ChatSession chat, List<Message> messages}) build() {
    final chat = ref.watch(generativeModelProvider).startChat(history: [
      Content.text('こんにちは、私は料理の勉強をしています。'),
      Content.model([TextPart('私は三つ星レストランでシェフをしています。なんでも聞いてください。')])
    ]);
    return (chat: chat, messages: []);
  }

  void _addMessage(User author, String text) {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final message = TextMessage(
      author: author,
      id: timeStamp,
      text: text,
    );
    state = (chat: state.chat, messages: [message, ...state.messages]);
  }

  Future<void> onSendPressed(PartialText text) async {
    final inputText = text.text;
    _addMessage(user, inputText);

    final content = Content.text(inputText);
    late final String message;
    try {
      final response = await state.chat.sendMessage(content);
      message = response.text ?? 'エラーが発生しました';
    } on Exception catch (e) {
      final isOverloaded = e.toString().contains('overloaded');
      message = isOverloaded ? '混雑しています。しばらくしてからもう一度お試しください。' : 'エラーが発生しました';
    } finally {
      _addMessage(ai, message);
    }
  }
}
