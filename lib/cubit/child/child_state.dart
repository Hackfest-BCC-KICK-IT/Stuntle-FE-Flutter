part of 'child_cubit.dart';

sealed class ChildState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChildInitial extends ChildState {}

final class HasChildData extends ChildState {
  final List<Child?> childData;

  HasChildData(this.childData);

  @override
  List<Object> get props => [childData];
}

final class DontChildData extends ChildState {}

final class LoadingChildData extends ChildState {}

final class ErorChildData extends ChildState {
  final String text;

  ErorChildData(this.text);

  @override
  List<Object> get props => [text];
}

final class AddChildDataLoading extends ChildState {}

final class AddChildDataSuccess extends ChildState {}

final class AddChildDataEror extends ChildState {
  final String text;

  AddChildDataEror(this.text);

  @override
  List<Object> get props => [text];
}
