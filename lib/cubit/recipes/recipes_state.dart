part of 'recipes_cubit.dart';

sealed class RecipesState {}

final class RecipesInitial extends RecipesState {}

final class AddRecipesSuccess extends RecipesState {}

final class AddRecipesLoading extends RecipesState {}

final class AddRecipesEror extends RecipesState {
  final String text;

  AddRecipesEror(this.text);
}

final class ReadRecipesSuccess extends RecipesState {}

final class ReadRecipesLoading extends RecipesState {}

final class ReadRecipesEror extends RecipesState {
  final String text;

  ReadRecipesEror(this.text);
}

final class FetchPrenangcyRecepiesSuccess extends RecipesState {}

final class FetchPrenangcyRecepiesNoData extends RecipesState {}

final class FetchPrenangcyRecepiesLoading extends RecipesState {}

final class FetchPrenangcyRecepiesEror extends RecipesState {
  final String text;

  FetchPrenangcyRecepiesEror(this.text);
}

final class FetchChildRecepiesSuccess extends RecipesState {}

final class FetchChildRecepiesNoData extends RecipesState {}

final class FetchChildRecepiesLoading extends RecipesState {}

final class FetchChildRecepiesEror extends RecipesState {
  final String text;

  FetchChildRecepiesEror(this.text);
}

final class SearchRecepiesSuccess extends RecipesState {
  final List<Recepies> dataApi;

  SearchRecepiesSuccess(this.dataApi);
}

final class SearchRecepiesNoData extends RecipesState {}

final class SearchRecepiesLoading extends RecipesState {}

final class SearchRecepiesEror extends RecipesState {
  final String text;

  SearchRecepiesEror(this.text);
}
