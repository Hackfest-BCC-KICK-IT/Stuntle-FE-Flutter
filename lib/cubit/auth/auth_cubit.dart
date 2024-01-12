import 'package:bloc/bloc.dart';
import 'package:stuntle/services/auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServices _authServices = AuthServices();

  void isHasLogin() async {
    try {
      final response = await _authServices.getUserProfile();

      response ? emit(Authenticated()) : emit(Unathenticated());
    } catch (eror) {
      emit(AuthEror("There is eror : ${eror.toString()}"));
    }
  }

  void loginServices(String email, String password) async {
    try {
      emit(AuthLoading());
      var response = await _authServices.login(email, password);

      if (response) {
        emit(AuthSucess());
        emit(AuthInitial());
      } else {
        emit(AuthEror("There is eror : response is false"));
      }
    } catch (eror) {
      emit(AuthEror("There is eror : ${eror.toString()}"));
    }
  }

  void registerServices(
    String email,
    String password,
    String fatherName,
    String motherName,
  ) async {
    try {
      emit(AuthLoading());
      var response =
          await _authServices.register(email, password, fatherName, motherName);
      if (response) {
        emit(AuthSucess());
      } else {
        emit(AuthEror("There is eror : response is false"));
      }
    } catch (eror) {
      emit(AuthEror("There is eror : ${eror.toString()}"));
    }
  }

  void logoutServices() async {
    try {
      emit(AuthLoading());
      bool response = await _authServices.logout();
      if (response) emit(Unathenticated());
    } catch (eror) {
      emit(AuthEror("There is eror : ${eror.toString()}"));
    }
  }
}
