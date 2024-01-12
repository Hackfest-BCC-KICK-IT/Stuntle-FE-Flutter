import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stuntle/data/model/message.dart';
import 'package:stuntle/services/message_services.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  final MessageServices _messageServices = MessageServices();

  void getMessage() async {
    emit(GetMessageLoading());
    try {
      await _messageServices.fectMessage();

      listMessage.isNotEmpty
          ? emit(GetMessageSuccess())
          : emit(GetMessageDontHave());
    } catch (eror) {
      emit(GetMessageEror(
          "there is eror at getMessageCubit: ${eror.toString()}"));
    }
  }

  void postMessage(String message) async {
    emit(PostMessageLoading());
    try {
      var responnse = await _messageServices.sendMessage(message);

      responnse != null
          ? emit(PostMessageSucces(responnse))
          : emit(const PostMessageEror("eror postMessage Cubit"));
    } catch (eror) {
      emit(PostMessageEror("eror postMessage Cubit : ${eror.toString()}"));
    }
  }
}
