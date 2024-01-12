part of 'help_cubit.dart';

sealed class HelpState extends Equatable {
  const HelpState();

  @override
  List<Object> get props => [];
}

final class HelpInitial extends HelpState {}

final class GetHelpLoading extends HelpState {}

final class GetHelpNoData extends HelpState {}

final class GetHelpSuccess extends HelpState {}

final class GetHelpEror extends HelpState {
  final String text;

  const GetHelpEror(this.text);
  @override
  List<Object> get props => [text];
}

final class AddHelpLoading extends HelpState {}

final class AddHelpSuccess extends HelpState {}

final class AddHelpEror extends HelpState {
  final String text;

  const AddHelpEror(this.text);

  @override
  List<Object> get props => [text];
}
