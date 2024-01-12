class Message {
  int id;
  String message;
  int fkOrtuId;
  DateTime createdAt;
  bool isSentByMe;

  Message({
    required this.id,
    required this.message,
    required this.fkOrtuId,
    required this.createdAt,
    required this.isSentByMe,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: int.parse(json["id"]),
        message: json["message"] ?? json["response"],
        fkOrtuId: json["fkOrtuId"],
        createdAt: DateTime.parse(json["createdAt"]),
        isSentByMe: json["isSentByMe"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "fkOrtuId": fkOrtuId,
        "createdAt":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "isSentByMe": isSentByMe,
      };
}

List<Message> listMessage = [];
