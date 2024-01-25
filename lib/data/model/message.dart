class Message {
  String? message;
  DateTime? createdAt;
  bool? isSentByMe;
  bool? isButton;

  Message({
    this.message,
    this.createdAt,
    this.isSentByMe,
    this.isButton,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
        isSentByMe: json["isSentByMe"],
        isButton: json["isButton"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "createdAt":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "isSentByMe": isSentByMe,
        "isButton": isButton,
      };
}

List<Message> listMessage = [
  Message(
    createdAt: DateTime(2023),
    message:
        "Aku sering mengalami pendaharan kecil selama kehamilan, kira-kira aku harus apa ya?",
    isButton: false,
    isSentByMe: true,
  ),
  Message(
    createdAt: DateTime(2023),
    message:
        "Pendaharan kecil atau spotting selama kehamilan dapat memiliki berbagai penyebab, dan seringkali tidak berbahaya. Namun, sangat penting untuk selalu berkonsultasi dengan dokter atau bidan untuk mendapatkan evaluasi dan saran yang sesuai dengan kondisi Anda.  Oleh karena itu aku sangat menyaranmu untuk berkonsultasi dengan meminta bantuan lebih lanjut kepada tenaga profesional melalui fitur ajukan bantuan",
    isButton: true,
    isSentByMe: false,
  ),
];
