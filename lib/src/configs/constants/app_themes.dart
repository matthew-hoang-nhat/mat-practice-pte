import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

import 'app_colors.dart';

class DarkTheme extends AppThemes {
  final ThemeData _darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(color: AppColors.colorPrimary),
      checkboxTheme: CheckboxThemeData(
          overlayColor: MaterialStateProperty.all(AppColors.colorPrimary)),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: AppColors.colorPrimary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextTheme(
        headline1: AppTextStyles.headline1,
        headline2: AppTextStyles.headline2,
        headline3: AppTextStyles.headline3,
        headline4: AppTextStyles.headline4,
        headline5: AppTextStyles.headline5,
        headline6: AppTextStyles.headline6,
        bodyText1: AppTextStyles.body1,
        bodyText2: AppTextStyles.body2.copyWith(color: AppColors.white),
        labelMedium: AppTextStyles.labelMedium,
        caption: AppTextStyles.caption,
        subtitle1: AppTextStyles.subTitle1,
        subtitle2: AppTextStyles.subTitle2,
      ));

  @override
  ThemeData themeData() {
    return _darkTheme;
  }
}

class LightTheme extends AppThemes {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(color: AppColors.colorPrimary),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: AppColors.colorPrimary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      backgroundColor: AppColors.white,
      textTheme: TextTheme(
        headline1: AppTextStyles.headline1,
        headline2: AppTextStyles.headline2,
        headline3: AppTextStyles.headline3,
        headline4: AppTextStyles.headline4,
        headline5: AppTextStyles.headline5,
        headline6: AppTextStyles.headline6,
        bodyText1: AppTextStyles.body1,
        bodyText2: AppTextStyles.body2,
        labelMedium: AppTextStyles.labelMedium,
        caption: AppTextStyles.caption,
        subtitle1: AppTextStyles.subTitle1,
        subtitle2: AppTextStyles.subTitle2,
      ));

  @override
  ThemeData themeData() {
    return lightTheme;
  }
}

abstract class AppThemes {
  ThemeData themeData();
}
