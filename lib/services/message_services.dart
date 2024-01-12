import 'package:dio/dio.dart';
import 'package:stuntle/data/constants/base.dart';
import 'package:stuntle/data/model/message.dart';
import 'package:stuntle/data/model/user.dart';

class MessageServices {
  final Dio _dio = Dio();

  Future<String?> sendMessage(String message) async {
    try {
      var response = await _dio.post(
        '$BASE_URL/chat',
        options:
            Options(headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}),
        data: {"message": message},
      );
      if (response.statusCode == 200) {
        return response.data["data"]["choices"][0]["message"]["content"];
      }
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
    } catch (eror) {
      throw Exception("eror at sendChat : ${eror.toString()}");
    }
    return null;
  }

  Future fectMessage() async {
    List<Message> sendMessageData = [];
    List<Message> responseMessageData = [];
    listMessage = [];
    try {
      var response = await _dio.get(
        '$BASE_URL/chat',
        options:
            Options(headers: {'Authorization': 'Bearer ${currUser.jwtToken} '}),
      );
      if (response.statusCode == 200) {
        var reponseMessage =
            response.data["data"]["responses"] as List<dynamic>;
        var sendMessage = response.data["data"]["messages"] as List<dynamic>;

        if (reponseMessage.isNotEmpty && sendMessage.isNotEmpty) {
          for (var item in reponseMessage[0]) {
            Message dataJson = Message(
              id: item["id"],
              message: item["response"],
              fkOrtuId: item["fkOrtuId"],
              createdAt: DateTime.parse(item["createdAt"]),
              isSentByMe: false,
            );
            responseMessageData.add(dataJson);
          }

          for (var item in sendMessage[0]) {
            Message dataJson = Message(
              id: item["id"],
              message: item["message"],
              fkOrtuId: item["fkOrtuId"],
              createdAt: DateTime.parse(item["createdAt"]),
              isSentByMe: true,
            );
            sendMessageData.add(dataJson);
          }

          for (int i = 0;
              i < responseMessageData.length && i < sendMessageData.length;
              i++) {
            listMessage.add(sendMessageData[i]);
            listMessage.add(responseMessageData[i]);
          }
        }
      }
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
    } catch (eror) {
      throw Exception("eror at fectMessage : ${eror.toString()}");
    }
  }
}
