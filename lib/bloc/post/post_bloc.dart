import 'package:bloc/bloc.dart';
import 'package:socialmediapp/bloc/post/post_event.dart';
import 'package:socialmediapp/bloc/post/post_state.dart';
import 'package:socialmediapp/services/database.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  UserDatabase _userRepository;

  PostBloc({
    required UserDatabase userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(EmptyPost());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is AddPost) {
          yield* _mapPosttoState(event.post);
    }
    else if (event is ReturnedFromTheDatabase) {

    }
  }
  Stream<PostState> _mapPosttoState(String post) async*{

    _userRepository.addPosttoDatabase(post);
    yield AdddedToTheDatabase();
  }

}
