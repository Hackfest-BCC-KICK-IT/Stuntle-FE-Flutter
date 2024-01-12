import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/prenangcy.dart';
import 'package:stuntle/data/model/user.dart';

class PregnancyServices {
  final Dio _dio = Dio();

  Future<Prenangcy?> getPrenangcyData() async {
    Prenangcy prenangcyData = Prenangcy();

    try {
      var responnse = await _dio.get("$BASE_URL/kehamilan/list?page=0&limit=10",
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));
      if (responnse.statusCode == 200) {
        if (responnse.data["success"] &&
            (responnse.data['data'] as List).isNotEmpty) {
          prenangcyData = Prenangcy(
            id: responnse.data['data'][0]['id'],
            namaCalonBayi: responnse.data['data'][0]['namaCalonBayi'],
            tanggalPertamaHaid: responnse.data['data'][0]['tanggalPertamaHaid'],
          );
        }
        return prenangcyData;
      }
    } catch (eror) {
      throw Exception("eror at getPrenangcyData ${eror.toString()}");
    }
    return null;
  }

  Future<Prenangcy?> addPrenagcyData(
    String babyName,
    String date,
  ) async {
    try {
      var responnse = await _dio.post("$BASE_URL/kehamilan",
          data: {
            "namaCalonBayi": babyName,
            "tanggalPertamaHaid": date,
          },
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (responnse.statusCode == 201) {
        Prenangcy prenangcyData = Prenangcy(
          id: responnse.data['data']['id'],
          namaCalonBayi: responnse.data['data']['namaCalonBayi'],
          tanggalPertamaHaid: responnse.data['data']['tanggalPertamaHaid'],
        );

        return prenangcyData;
      }
    } catch (eror) {
      throw Exception("eror at addPrenagcyData ${eror.toString()}");
    }
    return null;
  }
}
