import 'package:appsilon/src/features/authentication/domain/usecases/sign_in.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_state.dart';
export 'auth_event.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn _signIn;
  AuthBloc({required SignIn signIn})
      : _signIn = signIn,
        super(AuthInit()) {
    on<EvSignIn>((event, emit) async {
      emit(AuthLoading());
      final result =
          await _signIn(username: event.username, password: event.password);

      result.fold((l) {
        emit(AuthFail(l));
      }, (r) {
        emit(AuthSuccess());
      });
    });
  }
}
