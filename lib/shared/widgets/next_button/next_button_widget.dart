import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:devquiz/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundcolor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  NextButtonWidget({
    required this.label,
    required this.backgroundcolor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap
  });

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundcolor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.overlayWhite,
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundcolor = AppColors.white,
        this.fontColor = AppColors.lightGrey,
        this.label = label,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.overlayGrey,
        this.onTap = onTap;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundcolor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.overlayWhite,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            onPressed: onTap,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundcolor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                side: MaterialStateProperty.all(BorderSide(color: borderColor)),
                overlayColor: MaterialStateProperty.all(overlayColor),
                foregroundColor: MaterialStateProperty.all(fontColor)),
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600, fontSize: 15),
            )));
  }
}
