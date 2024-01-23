import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/services/cahce_services.dart';
import 'package:stuntle/services/key_chace.dart';

class AuthServices {
  final Dio _dio = Dio();

  Future<bool> getUserProfile() async {
    try {
      var response = await Cache.getData(userToken);
      if (response != null) {
        User newUser = User.fromJson(response);
        currUser = newUser;
        return true;
      }
    } catch (eror) {
      throw Exception("eror at getUserProfile ${eror.toString()}");
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      var response = await _dio.post('$BASE_URL/orangtua/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        await Cache.writeData(key: userToken, value: {
          'data': response.data['data'],
          'jwtToken': response.data['jwtToken'],
          'namaFaskes': null,
        });

        User newUser = User(
          data: Data.fromJson(response.data['data']),
          jwtToken: response.data['jwtToken'],
          namaFaskes: null,
        );
        currUser = newUser;

        return true;
      }
    } catch (eror) {
      throw Exception("eror at login ${eror.toString()}");
    }
    return false;
  }

  Future<bool> register(
    String email,
    String password,
    String waName,
    String motherName,
  ) async {
    try {
      var response = await _dio.post("$BASE_URL/orangtua", data: {
        "namaIbu": motherName,
        "nomorTelepon": waName,
        "email": email,
        "password": password
      });

      if (response.statusCode == 201) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at register ${eror.toString()}");
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      await Cache.deleteData(userToken);
      return true;
    } catch (eror) {
      throw Exception("eror at register ${eror.toString()}");
    }
  }
}
