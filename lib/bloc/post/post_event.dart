import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{
   PostEvent([List probs = const[]]): super();
}

class AddPost extends PostEvent{
  String post;
  AddPost(this.post): super([post]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ReturnPost extends PostEvent {
  List postList;
  ReturnPost(this.postList): super([postList]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}