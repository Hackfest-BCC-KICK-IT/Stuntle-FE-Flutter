class FilterChipData {
  String text;
  bool isSelected;
  FilterChipData({
    required this.text,
    required this.isSelected,
  });
}

List<FilterChipData> timeDataFilters = [
  FilterChipData(text: "Semua", isSelected: true),
  FilterChipData(text: "Sarapan", isSelected: false),
  FilterChipData(text: "Menu Siang", isSelected: false),
  FilterChipData(text: "Menu Malam", isSelected: false),
];

List<FilterChipData> usiaKehamilanFilters = [
  FilterChipData(text: 'Semua', isSelected: false),
  FilterChipData(text: 'Trisemester 1', isSelected: false),
  FilterChipData(text: 'Trisemester 2', isSelected: false),
  FilterChipData(text: 'Trisemester 3', isSelected: false),
];

List<FilterChipData> bahanMakananFilters = [
  FilterChipData(text: 'Sayuran', isSelected: false),
  FilterChipData(text: 'Buah-Buahan', isSelected: false),
  FilterChipData(text: 'Daging Sapi', isSelected: false),
  FilterChipData(text: 'Daging Ayam', isSelected: false),
  FilterChipData(text: 'Daging Ikan', isSelected: false),
  FilterChipData(text: 'Telur', isSelected: false),
  FilterChipData(text: 'Susu', isSelected: false),
  FilterChipData(text: 'Lainnya', isSelected: false),
];

List<FilterChipData> durasiPembuatanFilters = [
  FilterChipData(text: '10-20 Menit', isSelected: false),
  FilterChipData(text: '20-30 Menit', isSelected: false),
  FilterChipData(text: '30-60 Menit', isSelected: false),
  FilterChipData(text: 'Diatas 60 Menit', isSelected: false),
];

void resetFilters(List<FilterChipData> listData) {
  for (var filter in listData) {
    filter.isSelected = false;
  }
}
