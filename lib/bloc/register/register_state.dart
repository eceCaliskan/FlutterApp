import 'package:equatable/equatable.dart';

abstract class ResisterState extends Equatable{
  ResisterState([List probs = const[]]): super();
}

class RegisterSuccess extends ResisterState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RegisterFailure extends ResisterState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}