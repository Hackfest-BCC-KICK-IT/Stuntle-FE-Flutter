part of 'message_cubit.dart';

sealed class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

final class MessageInitial extends MessageState {}

final class PostMessageLoading extends MessageState {}

final class PostMessageSucces extends MessageState {
  final String text;

  const PostMessageSucces(this.text);

  @override
  List<Object> get props => [text];
}

final class PostMessageEror extends MessageState {
  final String text;

  const PostMessageEror(this.text);

  @override
  List<Object> get props => [text];
}

final class GetMessageLoading extends MessageState {}

final class GetMessageSuccess extends MessageState {}

final class GetMessageDontHave extends MessageState {}

final class GetMessageEror extends MessageState {
  final String text;

  const GetMessageEror(this.text);

  @override
  List<Object> get props => [text];
}
