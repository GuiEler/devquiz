import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: AppColors.chartSecondary,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      ),
    );
  }
}
