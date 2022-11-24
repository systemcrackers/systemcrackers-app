import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor(int idx) {
            if (qnController.isAnswered) {
              if (qnController.selectedAns == idx) {
                return Color(0xFF6AC259);
              }
            }
            return Color(0xff2f2f2f);
          }

          // IconData getTheRightIcon() {
          //   return getTheRightColor() == kRedColor ? Icons.done : Icons.done;
          // }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor(index)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style:
                        TextStyle(color: getTheRightColor(index), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor(index) == Color(0xff2f2f2f)
                          ? Colors.transparent
                          : getTheRightColor(index),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor(index)),
                    ),
                    child: getTheRightColor(index) == Color(0xff2f2f2f)
                        ? null
                        : Icon(Icons.done, size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
