import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stuntle/data/model/grup.dart';
import 'package:stuntle/services/grup_services.dart';

part 'grup_state.dart';

class GrupCubit extends Cubit<GrupState> {
  GrupCubit() : super(GrupInitial());

  final GrupSevices _grupSevices = GrupSevices();

  void getGrup() async {
    emit(GrupLoading());
    try {
      var response = await _grupSevices.fetchGrup();

      response != null ? emit(GrupSucces(response)) : emit(GrupNoData());
    } catch (eror) {
      emit(GrupEror("There is eror at getGrup : ${eror.toString()}"));
    }
  }
}
