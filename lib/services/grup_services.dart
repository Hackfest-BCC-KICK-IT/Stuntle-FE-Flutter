import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/grup.dart';
import 'package:stuntle/data/model/user.dart';

class GrupSevices {
  final Dio _dio = Dio();

  Future<List<Grup>?> fetchGrup() async {
    List<Grup> dataApi = [];
    try {
      var response = await _dio.get("$BASE_URL/whatsapp/ortu?limit=10&page=0",
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 200 && response.data['data'] != null) {
        for (var item in response.data['data']) {
          Grup dataJson = Grup(
            namaGrup: item['namaGrup'],
            linkGrup: item['linkGrup'],
          );
          dataApi.add(dataJson);
        }
        return dataApi;
      }
    } catch (eror) {
      throw Exception("eror at fetchGrup ${eror.toString()}");
    }
    return null;
  }
}
