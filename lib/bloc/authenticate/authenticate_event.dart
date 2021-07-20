import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticateEvent extends Equatable {
  AuthenticateEvent([List props = const []]) : super();
}



class Authenticate extends AuthenticateEvent {
  final String email;
  final String password;

  Authenticate({required this.email, required this.password})
      : super([email, password]);

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UnAuthenticate extends AuthenticateEvent {
  @override
  String toString() => 'LoginWithGooglePressed';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

