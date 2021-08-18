import 'package:bloc/bloc.dart';
import 'package:socialmediapp/bloc/post/post_event.dart';
import 'package:socialmediapp/bloc/post/post_state.dart';
import 'package:socialmediapp/services/database.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostDatabase _userRepository;

  PostBloc({
    required PostDatabase postDatabase,
  })  : assert(postDatabase != null),
        _userRepository = postDatabase,
        super(EmptyPost());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is AddPost) {
          yield* _mapPosttoState(event.post);
    }
    else if (event is ReturnPost) {
      yield* _mapReturnPosttoState();
    }
  }
  Stream<PostState> _mapPosttoState(String post) async*{

    _userRepository.addPosttoDatabase(post);
    String postList = _userRepository.getData() as String;
    yield ReturnedFromTheDatabase(postList);
  }

  Stream<PostState> _mapReturnPosttoState() async*{

    String postList = _userRepository.getData() as String;
    yield ReturnedFromTheDatabase(postList);
  }

}
