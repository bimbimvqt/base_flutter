import 'package:flutter_dotenv/flutter_dotenv.dart';

class GerminiApiServive {
  final String apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  late final String apiUrl;

  GerminiApiServive() {
    apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';
  }
}
