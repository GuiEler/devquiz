import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set _state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    _state = HomeState.loading;
    user = await repository.getUser();
    _state = HomeState.sucess;
  }

  void getQuizzes() async {
    _state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    _state = HomeState.sucess;
  }
}
