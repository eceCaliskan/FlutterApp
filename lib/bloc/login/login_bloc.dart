import 'package:bloc/bloc.dart';
import '../../services/database.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository, super(LoginEmpty());

  @override
  LoginState get initialState => LoginEmpty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    required String email,
    required String password,
  }) async* {
    yield LoginLoading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginSuccess(email: email, password: password);
    } catch (_) {
      yield LoginFailure();
    }
  }
}