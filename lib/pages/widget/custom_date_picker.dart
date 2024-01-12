import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

class CustomDatePicker extends StatefulWidget {
  final String title;
  final String subTitlel;
  final Function(String?) onDateSelected;
  const CustomDatePicker({
    Key? key,
    required this.title,
    required this.subTitlel,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: orangeColor,
              onPrimary: whiteColor,
              onSurface: greyColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: orangeColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(
          "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year.toString().padLeft(4, '0')}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: borderGreyColor,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _selectedDate == null
                      ? Text(
                          widget.title,
                          style: bodyMedium(sizeFont: 16, colorFont: greyColor),
                        )
                      : Text(
                          DateFormat('dd MMMM yyyy').format(_selectedDate!),
                          style: bodyMedium(
                            sizeFont: 16,
                          ),
                        ),
                  const Icon(Icons.calendar_today),
                ],
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
              widget.subTitlel,
              style: bodyMedium(
                colorFont: greyColor,
                sizeFont: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
