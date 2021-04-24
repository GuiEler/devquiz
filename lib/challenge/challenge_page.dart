import 'package:flutter/material.dart';

import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/route_animations/route_animations.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
      print(controller.currentPageNotifier);
    });
    super.initState();
    
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void onSelected(bool value) {
    if (value) {
      controller.contIsRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                        currentPage: value, length: widget.questions.length))
              ],
            )),
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.questions
              .map((question) =>
                  QuizWidget(question: question, onSelected: onSelected))
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value < widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.white(
                                  label: "Pular", onTap: nextPage)),
                        // if (value == widget.questions.length)
                        //   SizedBox(width: 7),
                        if (value == widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.green(
                                  label: "Confirmar",
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        RouteAnimations(
                                                route: ResultPage(
                                                    title: widget.title,
                                                    length:
                                                        widget.questions.length,
                                                    result:
                                                        controller.contIsRight),
                                                duration: 1000)
                                            .slide());
                                  }))
                      ],
                    ))),
      ),
    );
  }
}
