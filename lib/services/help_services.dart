import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/help.dart';
import 'package:stuntle/data/model/user.dart';

class HelpServices {
  final Dio _dio = Dio();

  Future<bool> postHelp(String title, String description) async {
    try {
      var response = await _dio.post("$BASE_URL/bantuan",
          options: Options(
              headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}),
          data: {
            "judulPengajuan": title,
            "deskripsiPengajuan": description,
          });

      if (response.statusCode == 201) {
        return true;
      }
    } catch (eror) {
      throw Exception("Eror at postHelp: ${eror.toString()} ");
    }
    return false;
  }

  Future<void> fetchListHelp() async {
    dataHelpUser = [];
    try {
      var response = await _dio.get(
        "$BASE_URL/bantuan/ortu?limit=10&page=0",
        options:
            Options(headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}),
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        for (var item in response.data['data']) {
          HelpSubmit dataJson = HelpSubmit(
            additionalMessages: item['pesanTambahan'],
            description: item['deskripsi'],
            statusHelp: getStatusHelpTypeFromString(item['status']),
            title: item['judul'],
          );
          dataHelpUser.add(dataJson);
        }
      }
    } catch (eror) {
      throw Exception("Eror at fetchListHelp: ${eror.toString()} ");
    }
  }
}
