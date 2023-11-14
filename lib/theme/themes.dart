import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemes{

  ThemeData darkTheme(){
    return ThemeData(
      scaffoldBackgroundColor: bgColorDark,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBGColorDark,
        titleTextStyle: TextStyle(
          color: textColorDark
        )
      ),
        iconTheme: IconThemeData(color: iconColorDark)
    );

  }

  ThemeData lightTheme(){
    return ThemeData(
        scaffoldBackgroundColor: bgColorLight,
        appBarTheme: AppBarTheme(
            backgroundColor: appBarBGColorLight,
            titleTextStyle: TextStyle(
                color: textColorLight
            )
        ),
        iconTheme: IconThemeData(color: iconColorLight)
    );

  }


}

//dark theme color

Color bgColorDark = Colors.grey;
Color textColorDark = Colors.white;
Color iconColorDark = Colors.white;
Color appBarBGColorDark = Colors.grey;

//light theme color

Color bgColorLight = Color(0xFFE8F5E9);
Color textColorLight = Colors.white;
Color iconColorLight = Colors.white;
Color appBarBGColorLight = Colors.green;