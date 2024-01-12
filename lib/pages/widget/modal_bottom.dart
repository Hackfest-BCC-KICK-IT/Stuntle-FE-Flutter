import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/data/constants/recipes_cons.dart';
import 'package:stuntle/pages/widget/filter_chip.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class FilterModalBottomSheet extends StatefulWidget {
  const FilterModalBottomSheet({super.key});

  @override
  State<FilterModalBottomSheet> createState() => _FilterModalBottomSheetState();
}

class _FilterModalBottomSheetState extends State<FilterModalBottomSheet> {
  List<String> selectedUsiaKehamilanFilters = [];
  List<String> selectedBahanMakananFilters = [];
  List<String> selectedDurasiPembuatanFilters = [];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
        ),
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: ListView(
          controller: scrollController,
          children: [
            Text(
              'Filter Resep Makanan',
              style: headline(),
            ),
            const SizedBox(height: 16),

            // FIlter berdasarkan usia kehamilan
            Text(
              'Usia Kehamilan',
              style: headline(sizeFont: 20),
            ),
            Wrap(
              children: usiaKehamilanFilters.map((filter) {
                return FilterChipCustom(
                  filter: filter,
                  onSelectedFunc: (selected) {
                    setState(() {
                      if (selected) {
                        selectedUsiaKehamilanFilters.add(filter.text);
                        resetFilters(usiaKehamilanFilters);
                        filter.isSelected = true;
                      } else {
                        selectedUsiaKehamilanFilters.remove(filter.text);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            // FIlter berdasarkan Bahan Makanan
            Text(
              'Bahan Makanan Utama',
              style: headline(sizeFont: 20),
            ),
            Wrap(
              children: bahanMakananFilters.map((filter) {
                return FilterChipCustom(
                  filter: filter,
                  onSelectedFunc: (selected) {
                    setState(() {
                      if (selected) {
                        selectedUsiaKehamilanFilters.add(filter.text);
                        filter.isSelected = !filter.isSelected;
                      } else {
                        selectedUsiaKehamilanFilters.remove(filter.text);
                        filter.isSelected = !filter.isSelected;
                      }
                    });
                  },
                );
              }).toList(),
            ),

            // FIlter berdasarkan Durasi Pembuatan
            Text(
              'Durasi Pembuatan',
              style: headline(sizeFont: 20),
            ),
            Wrap(
              children: durasiPembuatanFilters.map((filter) {
                return FilterChipCustom(
                  filter: filter,
                  onSelectedFunc: (selected) {
                    setState(() {
                      if (selected) {
                        selectedUsiaKehamilanFilters.add(filter.text);
                        filter.isSelected = !filter.isSelected;
                      } else {
                        selectedUsiaKehamilanFilters.remove(filter.text);
                        filter.isSelected = !filter.isSelected;
                      }
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),
            OrangeButton(
              contentText: "Tampilkan Resep",
              minimumSize: const Size(328, 48),
              maximumSize: const Size(double.infinity, 48),
              onPressedFunc: () {
                Navigator.pop(context, {
                  'usiaKehamilan': selectedUsiaKehamilanFilters,
                  'bahanMakanan': selectedBahanMakananFilters,
                  'durasiPembuatan': selectedDurasiPembuatanFilters,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
