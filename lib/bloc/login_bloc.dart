import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';

import '../database.dart';
import 'login_event.dart';
import 'login_state.dart';


///The Login bloc class returns the Login events to login States
///with the help of flutter_bloc
///@Ece caliskan
///2021

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository, super(null);

  @override
  // TODO: implement initialState
  LoginState get initialState =>  //setting the initial state

  @override
  //gettting the events to call the corresponding methods. The methods are used
  //to convert the return the state
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

  }

  ///checks the validity of the email with [email]
  Stream<LoginState> _mapEmailChangedToState() async* {

  }

  ///checks the validity of the password with [password]
  Stream<LoginState> _mapPasswordChangedState() async* {

  }


}
