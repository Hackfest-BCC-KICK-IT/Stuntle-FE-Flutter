part of 'grup_cubit.dart';

sealed class GrupState extends Equatable {
  const GrupState();

  @override
  List<Object> get props => [];
}

final class GrupInitial extends GrupState {}

final class GrupLoading extends GrupState {}

final class GrupNoData extends GrupState {}

final class GrupSucces extends GrupState {
  final List<Grup> listGrup;

  const GrupSucces(this.listGrup);

  @override
  List<Object> get props => [listGrup];
}

final class GrupEror extends GrupState {
  final String text;

  const GrupEror(this.text);

  @override
  List<Object> get props => [text];
}
