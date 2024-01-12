import 'package:bloc/bloc.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/services/health_services.dart';

part 'health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  HealthCubit() : super(HealthInitial());

  final HealthServices _healthServices = HealthServices();

  void isConnextedFakes() async {
    if (currUser.data.isConnectedWithFaskes) {
      emit(LoadingConnectedFakes());
      var res = await _healthServices.fetchFaskesName();
      if (res) emit(HasConnectedFakes());
    } else {
      emit(DontConnectedFakes());
    }
  }

  void connedtedfakes(String code) async {
    try {
      emit(LoadingConnectedFakes());
      var response = await _healthServices.connedtedfakes(code);
      response
          ? emit(SuccessConnectedFakes())
          : emit(ErorConnectedFakes("Fail to connect"));
    } catch (eror) {
      emit(ErorConnectedFakes(eror.toString()));
    }
  }
}
