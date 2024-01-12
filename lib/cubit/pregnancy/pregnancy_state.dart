part of 'pregnancy_cubit.dart';

sealed class PregnancyState {}

final class PregnancyInitial extends PregnancyState {}

class HasPregnancyData extends PregnancyState {
  Prenangcy prenangcyData;
  HasPregnancyData({
    required this.prenangcyData,
  });
}

final class DontPregnancyData extends PregnancyState {}

final class LoadingPregnancyData extends PregnancyState {}

final class ErorPregnancyData extends PregnancyState {
  final String text;

  ErorPregnancyData(this.text);
}

final class AddPregnancyDataLoading extends PregnancyState {}

final class AddPregnancyDataSuccess extends PregnancyState {
  final Prenangcy dataPrenangcy;

  AddPregnancyDataSuccess(this.dataPrenangcy);
}

final class AddPregnancyDataEror extends PregnancyState {
  final String text;

  AddPregnancyDataEror(this.text);
}
