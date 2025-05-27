import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class GerminiApiServive {
  String get apiKey {
    try {
      final key = dotenv.env['GEMINI_API_KEY'] ?? '';
      if (key.isEmpty) {
        debugPrint('Warning: GEMINI_API_KEY is empty or not found in .env file');
        debugPrint('Available env keys: ${dotenv.env.keys.toList()}');
      }
      return key;
    } catch (e) {
      debugPrint('Error loading GEMINI_API_KEY: $e');
      return '';
    }
  }

  String get apiUrl => 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';

  // Optional: Add a method to ensure dotenv is loaded
  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
  }
}
