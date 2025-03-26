class GerminiApiServive {
  final String apiKey = 'AIzaSyBrRg7G32QRg3uNVU-kvtlX0CmyUz8qAmo';
  late final String apiUrl;

  GerminiApiServive() {
    apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';
  }
}
