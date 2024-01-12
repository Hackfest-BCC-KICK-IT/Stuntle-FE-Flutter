import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

class PasswordForm extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String subText;
  const PasswordForm({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.subText,
  }) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.textEditingController,
          obscureText: isObscure,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
            ),
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
                color: borderGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: borderGreyColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
            left: 16,
            bottom: 16,
          ),
          child: Text(
            widget.subText,
            style: bodyMedium(
              colorFont: greyColor,
              sizeFont: 12,
            ),
          ),
        ),
      ],
    );
  }
}
