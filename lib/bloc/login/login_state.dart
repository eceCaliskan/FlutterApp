import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super();
}

class LoginEmpty extends LoginState {
  LoginEmpty() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginLoading extends LoginState {
  LoginLoading() : super();

  @override
  String toString() => 'PasswordChanged { }';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginSuccess extends LoginState {
  final String email;
  final String password;

  LoginSuccess({required this.email, required this.password})
      : super([email, password]);

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginFailure extends LoginState {
  @override
  String toString() => 'LoginWithGooglePressed';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
