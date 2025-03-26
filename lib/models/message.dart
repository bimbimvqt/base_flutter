class Message {
  final int id;
  final String content;
  final bool isUser;
  final DateTime timestamp;
  final String? imagePath;

  Message({
    required this.id,
    required this.content,
    required this.isUser,
    required this.timestamp,
    this.imagePath,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as int,
      content: json['content'] as String,
      isUser: json['isUser'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String).toUtc(), //Chuyển đổi sang UTC
      imagePath: json['imagePath'] as String?,
    );
  }
}
