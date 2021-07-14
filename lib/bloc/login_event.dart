import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]);
}

class LoginWithEmail extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithFacebook extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithGoogle extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithTwitter extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}