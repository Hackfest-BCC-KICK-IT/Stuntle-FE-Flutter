import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/pemeriksaan_kehamilan.dart';
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
          prenangcyData = Prenangcy.fromJson(responnse.data['data'][0]);
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

  String buildQueryParam(List<dynamic> dataList) {
    final queryParams = dataList.map((id) => 'id=$id');

    return queryParams.join('&');
  }

  Future<List<PemeriksaanPrenangcy>> fetchDataPemeriksaan(
      List<dynamic> id) async {
    final query = buildQueryParam(id);

    List<PemeriksaanPrenangcy> data = [];
    try {
      var responnse = await _dio.get(
          "$BASE_URL/pemeriksaan/kehamilan/ortu/list?$query",
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (responnse.statusCode == 200) {
        for (var item in responnse.data['data'] as List) {
          PemeriksaanPrenangcy dataJson = PemeriksaanPrenangcy.fromJson(item);
          data.add(dataJson);
        }
      }
    } catch (eror) {
      throw Exception("eror at fetchDataPemeriksaan ${eror.toString()}");
    }
    return data;
  }
}
