import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]);
}

class LoggedinWithEmail extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoggedinWithFacebook extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoggedinWithGoogle extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoggedinWithTwitter extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}