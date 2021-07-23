import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticateEvent extends Equatable {
  AuthenticateEvent([List props = const []]) : super();
}



class Authenticate1 extends AuthenticateEvent {


  Authenticate1()
      : super();

  @override
  String toString() {
    return 'Submitted { }';
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

