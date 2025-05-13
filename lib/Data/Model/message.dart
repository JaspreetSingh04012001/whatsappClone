class Message {
  String messageSendBy;
  DateTime messageTime;
  bool isSeen;
  String value;

  Message({
    required this.messageSendBy,
    required this.messageTime,
    required this.isSeen,
    required this.value,
  });
}
