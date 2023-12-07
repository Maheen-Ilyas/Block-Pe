import 'package:flutter/material.dart';

class LightTheme {
  static const brightness = Brightness.light;
  static const primary = Color(0xFF6d4ea1);
  static const onPrimary = Color(0xFFffffff);
  static const primaryContainer = Color(0xFFecdcff);
  static const onPrimaryContainer = Color(0xFF270057);
  static const secondary = Color(0xFF645b70);
  static const onSecondary = Color(0xFFffffff);
  static const secondaryContainer = Color(0xFFeadef7);
  static const onSecondaryContainer = Color(0xFF1f182a);
  static const tertiary = Color(0xFF7f525c);
  static const onTertiary = Color(0xFFffffff);
  static const tertiaryContainer = Color(0xFFffd9e0);
  static const onTertiaryContainer = Color(0xFF32101a);
  static const error = Color(0xFFba1a1a);
  static const onError = Color(0xFFffffff);
  static const errorContainer = Color(0xFFffdad6);
  static const onErrorContainer = Color(0xFF410002);
  static const background = Color(0xFFfffbff);
  static const onBackground = Color(0xFF1d1b1e);
  static const surface = Color(0xFFfffbff);
  static const onSurface = Color(0xFF1d1b1e);
  static const outline = Color(0xFF7b757f);
  static const surfaceVariant = Color(0xFFe8e0eb);
  static const onSurfaceVariant = Color(0xFF49454e);
}

final lightTheme = ThemeData(
  brightness: LightTheme.brightness,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      color: LightTheme.onSecondaryContainer,
      fontSize: 28,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      color: LightTheme.onSecondaryContainer,
      fontSize: 24,
    ),
    labelMedium: TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      color: LightTheme.onSecondaryContainer,
      fontSize: 20,
    ),
  ),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: LightTheme.background,
    height: 80,
    elevation: 2,
    surfaceTintColor: LightTheme.primary,
    shadowColor: LightTheme.onBackground,
    labelTextStyle: MaterialStatePropertyAll(
      TextStyle(
        fontFamily: "Lato",
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: LightTheme.onBackground,
      ),
    ),
    iconTheme: MaterialStatePropertyAll(
      IconThemeData(
        size: 26,
        color: LightTheme.onSecondaryContainer,
      ),
    ),
    indicatorColor: LightTheme.secondaryContainer,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  appBarTheme: const AppBarTheme(
    color: LightTheme.surface,
    toolbarHeight: 152,
    elevation: 0,
    surfaceTintColor: LightTheme.primary,
    titleTextStyle: TextStyle(
      fontFamily: 'Lato',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: LightTheme.onSurface,
    ),
    actionsIconTheme: IconThemeData(
      size: 44,
      color: LightTheme.onSurfaceVariant,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: LightTheme.surface,
    surfaceTintColor: LightTheme.primary,
    elevation: 1,
    scrimColor: LightTheme.surfaceVariant,
  ),
  dividerTheme: const DividerThemeData(
    color: LightTheme.outline,
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: LightTheme.onSecondaryContainer,
      fontFamily: "Lato",
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    helperStyle: TextStyle(
      color: LightTheme.onSurfaceVariant,
    ),
    labelStyle: TextStyle(
      color: LightTheme.primary,
      fontFamily: "Lato",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    errorStyle: TextStyle(
      color: LightTheme.error,
    ),
    iconColor: LightTheme.onSurfaceVariant,
    focusColor: LightTheme.onPrimary,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: LightTheme.error,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: LightTheme.primary,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: LightTheme.onPrimaryContainer,
        style: BorderStyle.solid,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: LightTheme.onPrimaryContainer,
      ),
    ),
    activeIndicatorBorder: BorderSide(
      width: 2,
      color: LightTheme.onSecondaryContainer,
      style: BorderStyle.solid,
    ),
    suffixIconColor: LightTheme.onPrimaryContainer,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        OutlinedBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          const CircleBorder(),
          0.5,
        ),
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontFamily: "Lato",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: LightTheme.onPrimary,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(
        LightTheme.primary,
      ),
      elevation: const MaterialStatePropertyAll(0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        OutlinedBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          const CircleBorder(),
          0.5,
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontFamily: "Lato",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: LightTheme.primary,
        ),
      ),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: LightTheme.surface,
    elevation: 3,
    surfaceTintColor: LightTheme.primary,
    titleTextStyle: TextStyle(
      fontFamily: "Lato",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: LightTheme.onSurface,
    ),
    contentTextStyle: TextStyle(
      fontFamily: "Lato",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: LightTheme.onSurfaceVariant,
    ),
    iconColor: LightTheme.secondary,
    alignment: Alignment.center,
  ),
);
