import 'package:bloc/bloc.dart';
import 'package:stuntle/data/model/prenangcy.dart';
import 'package:stuntle/services/prenangcy_services.dart';

part 'pregnancy_state.dart';

class PregnancyCubit extends Cubit<PregnancyState> {
  PregnancyCubit() : super(PregnancyInitial());

  final PregnancyServices _pregnancyServices = PregnancyServices();

  void hasPrenangcyData() async {
    emit(LoadingPregnancyData());
    try {
      var response = await _pregnancyServices.getPrenangcyData();

      if (response!.id != null) {
        emit(HasPregnancyData(prenangcyData: response));
      } else {
        emit(DontPregnancyData());
      }
    } catch (eror) {
      emit(ErorPregnancyData(
          "there is eror in hasPrenangcyData() ${eror.toString()}"));
    }
  }

  void addPrenagcyData(String name, String date) async {
    try {
      emit(AddPregnancyDataLoading());
      var response = await _pregnancyServices.addPrenagcyData(name, date);
      if (response != null) {
        emit(AddPregnancyDataSuccess(response));
      } else {
        emit(AddPregnancyDataEror("Add data prenangcy fail"));
      }
    } catch (eror) {
      emit(AddPregnancyDataEror(eror.toString()));
    }
  }

  // void updatePrenangcyData(String name, String date) async {
  //   try {
  //     emit(AddPregnancyDataLoading());
  //     await Cache.writeData(key: prenagcyData, value: {
  //       'name': name,
  //       'date': date,
  //     });
  //     emit(AddPregnancyDataSuccess());
  //   } catch (eror) {
  //     emit(AddPregnancyDataEror(eror.toString()));
  //   }
  // }

  // void removePrenangcyData() async {
  //   await Cache.deleteData(prenagcyData);
  //   emit(AddPregnancyDataSuccess());
  // }
}
