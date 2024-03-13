import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final String _apiKey;
  late final GenerativeModel _model;

  String? _text;
  bool _isLoading = false;

  Future<String?> _generateContent(GenerativeModel model) async {
    final content = [
      Content.text('Write how to learning flutter in Japanese.')
    ];
    setState(() {
      _isLoading = true;
    });
    final response = await model.generateContent(content);
    setState(() {
      _isLoading = false;
    });
    return response.text;
  }

  @override
  void initState() {
    super.initState();
    _apiKey = dotenv.get('GOOGLE_GENERATIVE_AI_KEY');
    _model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(_text ?? 'no-data'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading
            ? null
            : () async {
                final response = await _generateContent(_model);
                setState(() {
                  _text = response;
                });
              },
        child: const Icon(Icons.search),
      ),
    );
  }
}
