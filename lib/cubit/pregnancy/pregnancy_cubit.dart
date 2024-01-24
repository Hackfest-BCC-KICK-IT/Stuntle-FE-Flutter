import 'package:bloc/bloc.dart';
import 'package:stuntle/data/model/pemeriksaan_kehamilan.dart';
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

  void getDataPemeriksaan(List<dynamic> id) async {
    emit(PemeriksaanDataLoading());
    try {
      var responnse = await _pregnancyServices.fetchDataPemeriksaan(id);

      if (responnse.isNotEmpty) {
        emit(PemeriksaanDataSuccess(responnse));
      } else {
        emit(PemeriksaanDataNoData());
      }
    } catch (eror) {
      emit(PemeriksaanDataEror(eror.toString()));
    }
  }
}
