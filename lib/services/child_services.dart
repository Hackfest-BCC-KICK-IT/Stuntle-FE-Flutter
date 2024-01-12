import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/child_data.dart';
import 'package:stuntle/data/model/user.dart';

class ChildServices {
  final Dio _dio = Dio();

  Future<bool> postChildData(Child childUser) async {
    try {
      var response = await _dio.post('$BASE_URL/anak',
          data: childUser.toJson(),
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 201) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at postChildData ${eror.toString()}");
    }
    return false;
  }

  Future<List<Child?>> getChildData() async {
    List<Child?> childJson = [];
    try {
      var response = await _dio.get(
          '$BASE_URL/anak?id=${currUser.data.id}&limit=${10}',
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          Child dataJson = Child(
            namaAnak: item["namaAnak"],
            tanggalLahirAnak: item["tanggalLahir"],
            jenisKelamin: item["jenisKelamin"],
            kondisiLahir: item["kondisiLahir"],
            beratBadanLahir: item["beratBadanLahir"],
            panjangBadanLahir: item["panjangBadanLahir"],
            lingkarKepala: item["lingkarKepala"],
          );

          childJson.add(dataJson);
        }
      }
    } catch (eror) {
      throw Exception("eror at postChildData ${eror.toString()}");
    }
    return childJson;
  }
}
