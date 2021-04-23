import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button_widget/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card_widget/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Perito"),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                  child: GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map((quiz) => QuizCardWidget(
                          title: quiz.title,
                          completed:
                              "${quiz.questionAnswered} de ${quiz.questions.length}",
                          percentage:
                              (quiz.questionAnswered / quiz.questions.length),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
