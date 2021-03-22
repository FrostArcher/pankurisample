class MessageModel {
  final String imageUrl;
  final String title;
  final String message;
  final String time;
  final bool read;
  final num messageCount;

  MessageModel(
      {this.imageUrl,
      this.title,
      this.message,
      this.time,
      this.read,
      this.messageCount});
}
