import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:todo_new_app/styles/colors.dart';


class MyThemeData {
  static ThemeData lighttheme = ThemeData(
   colorScheme:  ColorScheme(
          brightness: Brightness.dark,
          primary: mintgreen,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary:primary,
          error: Colors.red,
          onError: Color(0xFFFFFFFF),
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.blueGrey,
          onSurface: Colors.white),
      scaffoldBackgroundColor: mintgreen,
      textTheme: TextTheme(
        bodySmall: TextStyle(
          fontFamily: 'elMessiri',
          fontSize: 12,
          color: Colors.white,
          
        ),
        bodyMedium: TextStyle(
          fontFamily: 'elMessiri',
          fontSize: 18,
          color: Color(0xffFFFFFF),
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'elMessiri',
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
       
        backgroundColor: Colors.transparent,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey[400],
      ),
      appBarTheme: AppBarTheme(
          
          color:primary,
     ));
     static ThemeData DarkTheme = ThemeData(
   colorScheme:  ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff060E1E),
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: primary,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Color(0xff141922),
          surface: Colors.blueGrey,
          onSurface: Colors.white),
      scaffoldBackgroundColor: mintgreen,
      textTheme: TextTheme(
        bodySmall: TextStyle(
          fontFamily: 'elMessiri',
          fontSize: 12,
          color: Colors.white,
          
        ),
        bodyMedium: TextStyle(
          fontFamily: 'elMessiri',
          fontSize: 18,
          color: Color(0xffFFFFFF),
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'elMessiri',
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
       
        backgroundColor:Color(0xff141922),
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey[400],
      ),
      appBarTheme: AppBarTheme(
          
          color:primary,
     ));

}

