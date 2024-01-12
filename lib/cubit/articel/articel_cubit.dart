import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stuntle/data/model/articel.dart';
import 'package:stuntle/services/articel_services.dart';
import 'package:stuntle/services/cahce_services.dart';
import 'package:stuntle/services/key_chace.dart';

part 'articel_state.dart';

class ArticelCubit extends Cubit<ArticelState> {
  ArticelCubit() : super(ArticelInitial());

  final ArticelServices _articelServices = ArticelServices();

  void readArticelBook() async {
    emit(ReadArticelBookLoading());
    try {
      var response = await Cache.getData(articelData);
      if (response != null && (response as List).isNotEmpty) {
        for (var item in response) {
          Articel dataJson = Articel.fromJson(item);

          bool exists = favoritArticel.any((existingData) {
            return existingData.judulArtikel == dataJson.judulArtikel &&
                existingData.updatedAt == dataJson.updatedAt;
          });

          if (!exists) {
            favoritArticel.add(dataJson);
          }
        }
        emit(ReadArticelBookSuccess());
      } else {
        emit(ReadArticelBookEror("There is no data"));
      }
    } catch (eror) {
      emit(ReadArticelBookEror(eror.toString()));
    }
  }

  void addBookmark(Articel articel) async {
    List<Map<String, dynamic>> articelJson = [];
    try {
      emit(AddArticelBookLoading());
      favoritArticel.add(articel);
      for (var item in favoritArticel) {
        var rawData = item.toJson();
        articelJson.add(rawData);
      }

      await Cache.writeData(key: articelData, value: articelJson);
      emit(AddArticelBookSucess());
    } catch (eror) {
      emit(AddArticelBookEror(eror.toString()));
    }
  }

  void removeBookmark(Articel articel) async {
    List<Map<String, dynamic>> articelJson = [];
    try {
      emit(AddArticelBookLoading());
      favoritArticel.remove(articel);
      for (var item in favoritArticel) {
        var rawData = item.toJson();
        articelJson.add(rawData);
      }

      await Cache.writeData(key: articelData, value: articelJson);
      emit(AddArticelBookSucess());
    } catch (eror) {
      emit(AddArticelBookEror(eror.toString()));
    }
  }

  void searchArticel(String titleArticel) async {
    emit(SearchArticelLoading());
    try {
      var response = await _articelServices.searchByTitle(titleArticel);

      response.isNotEmpty
          ? emit(SearchArticelSuccess(response))
          : emit(SearchArticelNoData());
    } catch (eror) {
      emit(SearchArticelEror(
          "There is eror searchArticel : ${eror.toString()}"));
    }
  }

  void fetchDataArticel() async {
    emit(FetchArticelLoading());
    try {
      await _articelServices.fetcListArticel();

      listDataArticel.isNotEmpty
          ? emit(FetchArticelSucces())
          : emit(FetchArticelNoData());
    } catch (eror) {
      emit(FetchArticelEror("eror at getListArticle: ${eror.toString()} "));
    }
  }
}
