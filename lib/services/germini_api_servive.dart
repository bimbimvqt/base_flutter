class GerminiApiServive {
  final String apiKey = '';
  late final String apiUrl;

  GerminiApiServive() {
    apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';
  }
}
