import 'package:bloc/bloc.dart';
import 'package:event_hup/features/auth/data/services/auth_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit(this._authService) : super(LoginInitial());

  void loadRememberedUsers() async {
    emit(LoginLoading());
    try {
      final users = await _authService.getRememberedUsers();
      if (users.isNotEmpty) {
        emit(LoginRememberedUsersLoaded(users));
      } else {
        emit(LoginInitial());
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void login(String email, String password, bool rememberMe) async {
    emit(LoginLoading());
    try {
      final success = await _authService.login(email, password, rememberMe);
      if (success) {
        emit(const LoginSuccess('Login successful'));
      } else {
        emit(const LoginFailure('Invalid email or password'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
