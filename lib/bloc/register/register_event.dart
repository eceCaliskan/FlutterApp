import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  RegisterEvent([List probs = const[]]): super();
}

class RegistertoApp extends RegisterEvent{
  String username;
  String email;
  String password;

  RegistertoApp(this.username, this.email, this.password) : super([username, email, password]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

