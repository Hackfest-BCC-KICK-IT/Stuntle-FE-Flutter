part of 'articel_cubit.dart';

sealed class ArticelState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ArticelInitial extends ArticelState {}

final class AddArticelBookSucess extends ArticelState {}

final class AddArticelBookLoading extends ArticelState {}

final class AddArticelBookEror extends ArticelState {
  final String text;

  AddArticelBookEror(this.text);

  @override
  List<Object> get props => [text];
}

final class ReadArticelBookSuccess extends ArticelState {}

final class ReadArticelBookLoading extends ArticelState {}

final class ReadArticelBookEror extends ArticelState {
  final String text;

  ReadArticelBookEror(this.text);

  @override
  List<Object> get props => [text];
}

final class FetchArticelLoading extends ArticelState {}

final class FetchArticelNoData extends ArticelState {}

final class FetchArticelSucces extends ArticelState {}

final class FetchArticelEror extends ArticelState {
  final String text;

  FetchArticelEror(this.text);

  @override
  List<Object> get props => [text];
}

final class SearchArticelLoading extends ArticelState {}

final class SearchArticelSuccess extends ArticelState {
  final List<Articel> resultData;

  SearchArticelSuccess(this.resultData);

  @override
  List<Object> get props => [resultData];
}

final class SearchArticelNoData extends ArticelState {}

final class SearchArticelEror extends ArticelState {
  final String text;

  SearchArticelEror(this.text);

  @override
  List<Object> get props => [text];
}
