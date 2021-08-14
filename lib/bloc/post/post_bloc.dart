import 'package:bloc/bloc.dart';
import 'package:socialmediapp/bloc/post/post_event.dart';
import 'package:socialmediapp/bloc/post/post_state.dart';
import 'package:socialmediapp/services/database.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  UserRepository _userRepository;

  PostBloc({
    required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(EmptyPost());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is AddPost) {

    }
    else if (event is ReturnedFromTheDatabase) {

    }
  }


}
