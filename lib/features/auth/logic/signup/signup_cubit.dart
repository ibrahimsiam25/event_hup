import 'package:bloc/bloc.dart';
import 'package:event_hup/core/helpers/auth_service.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthService _authService;

  SignupCubit(this._authService) : super(SignupInitial());

  void register(String name, String email, String password) async {
    emit(SignupLoading());
    try {
      final id = await _authService.register(name, email, password);
      if (id > 0) {
        emit(const SignupSuccess('Registration successful'));
      } else {
        emit(const SignupFailure('Registration failed'));
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
