import 'package:flutter/material.dart';
import 'package:stuntle/config/route_name.dart';

class ProfileService {
  IconData? icon;
  String text;
  String? image;
  String route;
  ProfileService({
    this.icon,
    required this.text,
    this.image,
    required this.route,
  });
}

List<ProfileService> profileService = [
  ProfileService(
    icon: Icons.account_circle_outlined,
    text: 'Akun Saya',
    route: profileUserRoute,
  ),
  ProfileService(
      icon: Icons.save_as_outlined,
      text: 'Data Profil Kehamilan/Anak Saya',
      route: dataUserRoute),
  ProfileService(
    text: 'Hubungkan Ke Faskes Terdekat',
    icon: Icons.local_hospital,
    route: nearFaskesRoute,
  ),
  ProfileService(
    text: 'Resep/Artikel Tersimpan',
    icon: Icons.bookmark_outline,
    route: savedUserRoute,
  ),
  ProfileService(
    text: 'Tentang Kami',
    route: aboutUsRoute,
    icon: Icons.error_outline,
  ),
  ProfileService(
    text: "Log Out",
    route: loginRoute,
    icon: Icons.logout_outlined,
  )
];
