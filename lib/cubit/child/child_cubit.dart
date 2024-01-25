import 'package:bloc/bloc.dart';
import 'package:stuntle/data/model/child_data.dart';
import 'package:stuntle/data/model/pemeriksaan_anak.dart';
import 'package:stuntle/services/child_services.dart';
import 'package:equatable/equatable.dart';

part 'child_state.dart';

class ChildCubit extends Cubit<ChildState> {
  ChildCubit() : super(ChildInitial());

  final ChildServices _childServices = ChildServices();

  void hasChildData() async {
    try {
      emit(LoadingChildData());
      var response = await _childServices.getChildData();

      if (response.isNotEmpty) {
        emit(HasChildData(response));
      } else {
        emit(DontChildData());
      }
    } catch (eror) {
      emit(ErorChildData("There is eror ${eror.toString()}"));
    }
  }

  void addChildUserData(Child userData) async {
    try {
      emit(AddChildDataLoading());
      var response = await _childServices.postChildData(userData);

      response
          ? emit(AddChildDataSuccess())
          : emit(AddChildDataEror("Faild add Child"));
    } catch (eror) {
      emit(AddChildDataEror(eror.toString()));
    }
  }

  void fetchDataPemeriksaan(List<dynamic> ids) async {
    emit(DataPemeriksaanLoading());
    try {
      var responnse = await _childServices.fetchPemeriksaanChild(ids);
      if (responnse.isNotEmpty) {
        emit(DataPemeriksaanSuccess(data: responnse));
      } else {
        emit(DataPemeriksaanNoData());
      }
    } catch (eror) {
      emit(DataPemeriksaanEror(eror.toString()));
    }
  }
}
