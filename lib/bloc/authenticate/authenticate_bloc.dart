import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_event.dart';
import 'package:socialmediapp/bloc/login/login_state.dart';
import 'package:socialmediapp/services/database.dart';

import 'authenticate_state.dart';

class AuthenticationBloc extends Bloc<AuthenticateEvent, AuthenticateState>{
  UserRepository _userRepository;

  AuthenticationBloc({
    required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository, super(AuthenticateEmpty());


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