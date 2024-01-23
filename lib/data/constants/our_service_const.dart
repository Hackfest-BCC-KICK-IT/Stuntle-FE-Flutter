import 'package:flutter/material.dart';
import 'package:stuntle/config/route_name.dart';

List<Map<String, dynamic>> servicesConst = [
  {
    'title': 'Konsultasi \n Dengan CATAS',
    'image': 'assets/images/grid1.jpg',
    'color1': const Color(0xFF5D9BF8),
    'color2': const Color.fromRGBO(93, 155, 248, 0.8),
    'routeTo': chatPagesRoute,
  },
  {
    'title': 'Pantau Kehamilan \n dan Anak',
    'image': 'assets/images/grid2.jpg',
    'color1': const Color(0xFFEE4F57),
    'color2': const Color.fromRGBO(244, 105, 112, 0.8),
    'routeTo': pantauAnakRoute,
  },
  {
    'title': 'Grup Orang Tua\ndan Posyandu',
    'image': 'assets/images/grid3.jpg',
    'color1': const Color(0xFF58B961),
    'color2': const Color.fromRGBO(88, 185, 97, 0.8),
    'routeTo': grupRoute,
  },
  {
    'title': 'Ajukan\nBantuan',
    'image': 'assets/images/grid4.jpg',
    'color1': const Color(0xFFEE924F),
    'color2': const Color.fromRGBO(238, 146, 79, 0.8),
    'routeTo': bantuanPage,
  },
];
