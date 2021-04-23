import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';

class ChartWidget extends StatelessWidget {
  final double value;
  const ChartWidget({
    Key? key,
    required this.value,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: value/100,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              "$value%",
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}
