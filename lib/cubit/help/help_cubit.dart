import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stuntle/data/model/help.dart';
import 'package:stuntle/services/help_services.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());

  final HelpServices _helpServices = HelpServices();

  void fetchHelpData() async {
    emit(GetHelpLoading());
    try {
      await _helpServices.fetchListHelp();

      dataHelpUser.isNotEmpty ? emit(GetHelpSuccess()) : emit(GetHelpNoData());
    } catch (eror) {
      emit(GetHelpEror("There is eror fetchHelpData : ${eror.toString()}"));
    }
  }

  void addHelpData(HelpSubmit helpSubmit) async {
    emit(AddHelpLoading());
    try {
      var response = await _helpServices.postHelp(
          helpSubmit.title, helpSubmit.description);
      response
          ? emit(AddHelpSuccess())
          : emit(const AddHelpEror("Ajukan Bantuan tidak dapat dilakukan"));
    } catch (eror) {
      emit(AddHelpEror("There is eror addHelpData : ${eror.toString()}"));
    }
  }
}
