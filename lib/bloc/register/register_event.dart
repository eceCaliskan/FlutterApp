import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  RegisterEvent([List probs = const[]]): super();
}

class RegistertoApp extends RegisterEvent{
  String email;
  String password;
  String username;

  RegistertoApp(this.email, this.password, this.username) : super([email, password, username]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

