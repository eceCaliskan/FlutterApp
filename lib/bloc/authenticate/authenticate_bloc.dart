import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_event.dart';
import 'package:socialmediapp/bloc/login/login_state.dart';
import 'package:socialmediapp/services/database.dart';

import 'authenticate_state.dart';

class AuthenticationBloc extends Bloc<AuthenticateEvent, AuthenticateState>{
  UserDatabase _userRepository;

  AuthenticationBloc({
    required UserDatabase userDatabase,
  })  : assert(userDatabase != null),
        _userRepository = userDatabase, super(AuthenticateEmpty());


  @override
  Stream<AuthenticateState> mapEventToState(AuthenticateEvent event) async* {
    if(event is Auth)
    {
      yield* _mapAuthenticateToState( );
    }
    else if (event is UnAuthenticate)
    {
      yield* _mapUnauthenticateToState();
    }
  }

  Stream<AuthenticateState> _mapAuthenticateToState() async* {
    yield AuthenticateSuccess();
  }

  Stream<AuthenticateState> _mapUnauthenticateToState() async* {
    _userRepository.signOut();
    yield AuthenticateFailure();
  }

}