import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticateState extends Equatable {
  AuthenticateState([List props = const []]) : super();
}

class AuthenticateEmpty extends AuthenticateState {
  AuthenticateEmpty() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticateSuccess extends AuthenticateState {


  AuthenticateSuccess()
      : super();

  @override
  String toString() {
    return 'Submitted { }';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticateFailure extends AuthenticateState {
  @override
  String toString() => 'LoginWithGooglePressed';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignedOut extends AuthenticateState {
  @override
  String toString() => 'LoginWithGooglePressed';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
