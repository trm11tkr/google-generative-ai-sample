import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generative_model.g.dart';

@riverpod
GenerativeModel generativeModel(GenerativeModelRef ref) {
  final apiKey = dotenv.get('GOOGLE_GENERATIVE_AI_KEY');
  return GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
}
