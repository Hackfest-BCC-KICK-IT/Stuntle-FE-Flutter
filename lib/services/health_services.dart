import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/services/cahce_services.dart';
import 'package:stuntle/services/key_chace.dart';

class HealthServices {
  final Dio _dio = Dio();

  Future<bool> connedtedfakes(String code) async {
    try {
      var response = await _dio.post(
          "$BASE_URL/ortu/faskes/kode/{kode_unik}?kode_unik=$code",
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 201) {
        currUser.data.isConnectedWithFaskes = true;
        await Cache.writeData(key: userToken, value: currUser.toJson());

        return true;
      }
    } catch (eror) {
      throw Exception("eror at login ${eror.toString()}");
    }

    return false;
  }

  Future<bool> fetchFaskesName() async {
    try {
      var response = await _dio.get("$BASE_URL/ortu/faskes/description",
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 200) {
        currUser.namaFaskes = response.data['data']['faskes']['username'];
        await Cache.writeData(key: userToken, value: currUser.toJson());
        return true;
      }
    } catch (eror) {
      throw Exception("eror at login ${eror.toString()}");
    }
    return false;
  }
}
