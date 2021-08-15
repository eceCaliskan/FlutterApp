import 'package:bloc/bloc.dart';
import 'package:socialmediapp/bloc/register/register_event.dart';
import 'package:socialmediapp/bloc/register/register_state.dart';
import 'package:socialmediapp/services/database.dart';

class RegisterBloc extends Bloc<RegisterEvent, ResisterState> {
  UserDatabase _userRepository;

  RegisterBloc({
    required UserDatabase userDatabase,
  })  : assert(userDatabase != null),
        _userRepository = userDatabase, super(EmptyRegister());


  @override
  Stream<ResisterState> mapEventToState(RegisterEvent event)  async* {
    if(event is RegistertoApp){
      yield* _mapRegistertoState(event.username, event.email, event.password);
    }
  }

  Stream<ResisterState> _mapRegistertoState(String username, String email, String password) async*{
        await _userRepository.signUp(email: email, password: password);
         _userRepository.addtoDatabase(username);
        yield RegisterSuccess();
  }

}