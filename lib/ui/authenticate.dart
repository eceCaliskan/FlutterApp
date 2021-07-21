import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_bloc.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_event.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_state.dart';
import 'package:socialmediapp/services/database.dart';
import 'package:socialmediapp/ui/welcome.dart';

import 'home.dart';
import 'login.dart';




class Authenticate extends StatelessWidget {
  UserRepository _userRepository = UserRepository();



  @override
  Widget build(BuildContext context) {



    return BlocProvider(
        create: (BuildContext context) =>
           AuthenticationBloc(userRepository: _userRepository),
        child: BlocBuilder<AuthenticationBloc, AuthenticateState>(
          builder: (BuildContext context, state) {
            if(state is AuthenticateSuccess){
              Navigator.push(context,
                 MaterialPageRoute(builder: (BuildContext context) => Home()));
           }
            else if (state is AuthenticateFailure || state is AuthenticateEmpty) {
             return Login();
            }
            return Home();
          },
   ),
   );
  }
}
