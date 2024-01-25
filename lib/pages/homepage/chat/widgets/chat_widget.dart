import 'package:flutter/material.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class SenderChatWidget extends StatelessWidget {
  final String message;
  const SenderChatWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

class ResponseChatWidget extends StatelessWidget {
  final String message;
  final bool isButton;
  const ResponseChatWidget({
    Key? key,
    required this.message,
    required this.isButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Column(
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Visibility(
              visible: isButton,
              child: OrangeButton(
                contentText: "Buka Ajuan Bantuan",
                minimumSize: const Size(210, 38),
                maximumSize: const Size(double.infinity, 38),
                onPressedFunc: () => Navigator.pushNamed(context, bantuanPage),
              ))
        ],
      ),
    );
  }
}
