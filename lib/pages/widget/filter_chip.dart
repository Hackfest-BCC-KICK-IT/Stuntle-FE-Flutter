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
      child: FilterChip(
        showCheckmark: false,
        label: Text(widget.filter.text),
        labelStyle: TextStyle(
          color: widget.filter.isSelected ? whiteColor : lightVioletColor,
        ),
        backgroundColor:
            widget.filter.isSelected ? lightVioletColor : whiteColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: lightVioletColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        selected: widget.filter.isSelected,
        onSelected: widget.onSelectedFunc,
      ),
    );
  }
}
