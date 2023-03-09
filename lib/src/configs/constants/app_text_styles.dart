import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class AppTextStyles {
  static final body1 = GoogleFonts.nunito(fontSize: 16);
  static final body2 = GoogleFonts.nunito();
  static final headline1 = GoogleFonts.nunito(
      fontSize: 96, fontWeight: FontWeight.bold, color: AppColors.colorPrimary);
  static final headline2 = GoogleFonts.nunito(
      fontSize: 60, fontWeight: FontWeight.bold, color: AppColors.colorPrimary);
  static final headline3 = GoogleFonts.nunito(
      fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.colorPrimary);
  static final headline4 = GoogleFonts.nunito(
      fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.colorPrimary);
  static final headline5 = GoogleFonts.nunito(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.colorPrimary);
  static final headline6 = GoogleFonts.nunito(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.colorPrimary);
  static final subTitle1 = GoogleFonts.nunito(fontSize: 16);
  static final subTitle2 = GoogleFonts.nunito(fontSize: 14);
  static final labelMedium =
      GoogleFonts.nunito(fontSize: 12, color: AppColors.colorLabel);
  static final caption = GoogleFonts.nunito(fontSize: 13);
  static final phonetic = GoogleFonts.voces(fontSize: 14);

  static final preQuestion = GoogleFonts.nunito(fontSize: 20);
  static final titleDialog = AppTextStyles.headline5;
  static final mediumTitleDialog = GoogleFonts.nunito(fontSize: 20);
  static final wordInkwell = GoogleFonts.nunito(fontSize: 20);
}
