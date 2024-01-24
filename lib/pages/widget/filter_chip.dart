import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/data/constants/recipes_cons.dart';

class FilterChipCustom extends StatefulWidget {
  final FilterChipData filter;
  final void Function(bool)? onSelectedFunc;

  const FilterChipCustom({
    Key? key,
    required this.filter,
    this.onSelectedFunc,
  }) : super(key: key);

  @override
  State<FilterChipCustom> createState() => _FilterChipCustomState();
}

class _FilterChipCustomState extends State<FilterChipCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.onSelectedFunc != null) {
              widget.onSelectedFunc!(!widget.filter.isSelected);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: widget.filter.isSelected ? bgFilterChip : whiteColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: lightVioletColor),
            ),
            child: Text(
              widget.filter.text,
              style: TextStyle(
                color: widget.filter.isSelected ? whiteColor : bgFilterChip,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
