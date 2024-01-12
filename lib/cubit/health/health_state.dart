part of 'health_cubit.dart';

sealed class HealthState {}

final class HealthInitial extends HealthState {}

final class UnConnectedFakes extends HealthState {}

final class ErorConnectedFakes extends HealthState {
  final String text;

  ErorConnectedFakes(this.text);
}

final class HasConnectedFakes extends HealthState {}

final class SuccessConnectedFakes extends HealthState {}

final class DontConnectedFakes extends HealthState {}

final class LoadingConnectedFakes extends HealthState {}
