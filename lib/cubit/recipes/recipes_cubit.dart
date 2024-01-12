import 'package:bloc/bloc.dart';

import 'package:stuntle/data/model/detail_recipes.dart';
import 'package:stuntle/services/cahce_services.dart';
import 'package:stuntle/services/key_chace.dart';
import 'package:stuntle/services/recepies_services.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesInitial());

  final RecepiesServices _recepiesServices = RecepiesServices();

  void readRecepiesBook() async {
    try {
      var response = await Cache.getData(recepiesData);
      if (response != null && (response as List).isNotEmpty) {
        for (var item in response) {
          Recepies dataJson = Recepies.fromJson(item);

          bool exists = favoritRecepies.any((existingData) {
            return existingData.id == dataJson.id &&
                existingData.urlGambar == dataJson.urlGambar;
          });

          if (!exists) {
            favoritRecepies.add(dataJson);
          }
        }
        emit(ReadRecipesSuccess());
      } else {
        emit(ReadRecipesEror("there is no data"));
      }
    } catch (eror) {
      emit(ReadRecipesEror(eror.toString()));
    }
  }

  void addBookmark(Recepies recipesDummy) async {
    List<Map<String, dynamic>> articelJson = [];
    try {
      emit(AddRecipesLoading());
      favoritRecepies.add(recipesDummy);
      for (var item in favoritRecepies) {
        var rawData = item.toJson();
        articelJson.add(rawData);
      }

      await Cache.writeData(key: recepiesData, value: articelJson);
      emit(AddRecipesSuccess());
    } catch (eror) {
      emit(AddRecipesEror(eror.toString()));
    }
  }

  void removeBookmark(Recepies recipesDummy) async {
    List<Map<String, dynamic>> articelJson = [];
    try {
      emit(AddRecipesLoading());
      favoritRecepies.remove(recipesDummy);
      for (var item in favoritRecepies) {
        var rawData = item.toJson();
        articelJson.add(rawData);
      }

      await Cache.writeData(key: recepiesData, value: articelJson);
      emit(AddRecipesSuccess());
    } catch (eror) {
      emit(AddRecipesEror(eror.toString()));
    }
  }

  void getListPrenangcyRecepies() async {
    emit(FetchPrenangcyRecepiesLoading());
    try {
      await _recepiesServices.fetchListRecepiesPrenangcy();

      listPrenangcyRecepies.isNotEmpty
          ? emit(FetchPrenangcyRecepiesSuccess())
          : emit(FetchPrenangcyRecepiesNoData());
    } catch (eror) {
      emit(FetchPrenangcyRecepiesEror(
          "there is eror getListPrenangcyRecepies: ${eror.toString()} "));
    }
  }

  void getListChildRecepies() async {
    emit(FetchChildRecepiesLoading());
    try {
      await _recepiesServices.fetchListRecepiesChild();

      listPrenangcyRecepies.isNotEmpty
          ? emit(FetchChildRecepiesSuccess())
          : emit(FetchChildRecepiesNoData());
    } catch (eror) {
      emit(FetchChildRecepiesEror(
          "there is eror getListPrenangcyRecepies: ${eror.toString()} "));
    }
  }

  void fetchRecepiesData() {
    getListPrenangcyRecepies();
    getListChildRecepies();
  }

  void searchRecepies(
    String title,
    String recepiesFor,
  ) async {
    emit(SearchRecepiesLoading());
    try {
      var response = await _recepiesServices.searchByTitle(recepiesFor, title);

      response.isNotEmpty
          ? emit(SearchRecepiesSuccess(response))
          : emit(SearchRecepiesNoData());
    } catch (eror) {
      emit(SearchRecepiesEror(
          "There is eror at searchRecepies: ${eror.toString()} "));
    }
  }
}
