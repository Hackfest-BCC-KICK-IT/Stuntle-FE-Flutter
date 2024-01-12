import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/articel.dart';
import 'package:stuntle/data/model/user.dart';

class ArticelServices {
  final Dio _dio = Dio();

  Future<void> fetcListArticel() async {
    listDataArticel = [];
    try {
      var response = await _dio.get('$BASE_URL/artikel/ortu/list',
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 200) {
        for (var item in response.data['data']) {
          Articel dataJson = Articel(
            id: item['id'],
            publicId: item['publicId'],
            linkGambar: item['linkGambar'],
            judulArtikel: item['judulArtikel'],
            peninjau: item['peninjau'],
            isiText: item['isiText'],
            updatedAt: item['updatedAt'],
            isFavorit: false,
          );

          bool exists = favoritArticel.any((existingData) {
            return existingData.judulArtikel == dataJson.judulArtikel &&
                existingData.id == dataJson.id;
          });

          if (exists) dataJson.isFavorit = true;
          listDataArticel.add(dataJson);
        }
      }
    } catch (eror) {
      throw Exception("Eror at fetcListArticel : ${eror.toString()}");
    }
  }

  Future<List<Articel>> searchByTitle(String titleArticel) async {
    List<Articel> dataApi = [];
    try {
      var response = await _dio.get(
          '$BASE_URL/artikel/ortu/judul?page=0&limit=10&judulArtikel=$titleArticel',
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}));

      if (response.statusCode == 200 && (response.data['data'] != null)) {
        for (var item in response.data['data']) {
          Articel dataJson = Articel(
            id: item['id'],
            publicId: item['publicId'],
            linkGambar: item['linkGambar'],
            judulArtikel: item['judulArtikel'],
            peninjau: item['peninjau'],
            isiText: item['isiText'],
            updatedAt: item['updatedAt'],
            isFavorit: false,
          );

          bool exists = favoritArticel.any((existingData) {
            return existingData.judulArtikel == dataJson.judulArtikel &&
                existingData.id == dataJson.id;
          });

          if (exists) dataJson.isFavorit = true;
          dataApi.add(dataJson);
        }
      }
    } catch (eror) {
      throw Exception("Eror at searchByTitle : ${eror.toString()}");
    }
    return dataApi;
  }
}
