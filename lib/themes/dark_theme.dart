import 'package:flutter/material.dart';

class DarkTheme {
  static const brightness = Brightness.dark;
  static const primary = Color(0xFFd5baff);
  static const onPrimary = Color(0xFF3d1c6f);
  static const primaryContainer = Color(0xFF553587);
  static const onPrimaryContainer = Color(0xFFecdcff);
  static const secondary = Color(0xFFcec2db);
  static const onSecondary = Color(0xFF352d40);
  static const secondaryContainer = Color(0xFF4b4357);
  static const onSecondaryContainer = Color(0xFFeadef7);
  static const tertiary = Color(0xFFf1b7c3);
  static const onTertiary = Color(0xFF4b252f);
  static const tertiaryContainer = Color(0xFF643b45);
  static const onTertiaryContainer = Color(0xFFffd9e0);
  static const error = Color(0xFFffb4ab);
  static const onError = Color(0xFF690005);
  static const errorContainer = Color(0xFF93000a);
  static const onErrorContainer = Color(0xFFffdad6);
  static const background = Color(0xFF1d1b1e);
  static const onBackground = Color(0xFFe6e1e6);
  static const surface = Color(0xFF1d1b1e);
  static const onSurface = Color(0xFFe6e1e6);
  static const outline = Color(0xFF958e99);
  static const surfaceVariant = Color(0xFF49454e);
  static const onSurfaceVariant = Color(0xFFcbc4cf);
}

final darkTheme = ThemeData(
  brightness: DarkTheme.brightness,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      color: DarkTheme.onSecondaryContainer,
      fontSize: 28,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      color: DarkTheme.onSecondaryContainer,
      fontSize: 24,
    ),
    labelMedium: TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      color: DarkTheme.onSecondaryContainer,
      fontSize: 20,
    ),
  ),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: DarkTheme.background,
    height: 80,
    elevation: 2,
    surfaceTintColor: DarkTheme.primary,
    shadowColor: DarkTheme.onBackground,
    labelTextStyle: MaterialStatePropertyAll(
      TextStyle(
        fontFamily: "Lato",
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: DarkTheme.onBackground,
      ),
    ),
    iconTheme: MaterialStatePropertyAll(
      IconThemeData(
        size: 26,
        color: DarkTheme.onSecondaryContainer,
      ),
    ),
    indicatorColor: DarkTheme.secondaryContainer,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  appBarTheme: const AppBarTheme(
    color: DarkTheme.surface,
    toolbarHeight: 152,
    elevation: 0,
    surfaceTintColor: DarkTheme.primary,
    titleTextStyle: TextStyle(
      fontFamily: 'Lato',
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: DarkTheme.onSurface,
    ),
    actionsIconTheme: IconThemeData(
      size: 44,
      color: DarkTheme.onSurfaceVariant,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: DarkTheme.surface,
    surfaceTintColor: DarkTheme.primary,
    elevation: 1,
    scrimColor: DarkTheme.surfaceVariant,
  ),
  dividerTheme: const DividerThemeData(
    color: DarkTheme.outline,
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: DarkTheme.onSecondaryContainer,
      fontFamily: "Lato",
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    helperStyle: TextStyle(
      color: DarkTheme.onSurfaceVariant,
    ),
    labelStyle: TextStyle(
      color: DarkTheme.primary,
      fontFamily: "Lato",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    errorStyle: TextStyle(
      color: DarkTheme.error,
    ),
    iconColor: DarkTheme.onSurfaceVariant,
    focusColor: DarkTheme.onPrimary,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: DarkTheme.error,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: DarkTheme.primary,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: DarkTheme.onPrimaryContainer,
        style: BorderStyle.solid,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
          width: 2,
          color: DarkTheme.onPrimaryContainer,
          style: BorderStyle.solid),
    ),
    activeIndicatorBorder: BorderSide(
      width: 2,
      color: DarkTheme.onSecondaryContainer,
      style: BorderStyle.solid,
    ),
    suffixIconColor: DarkTheme.onPrimaryContainer,
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
          color: DarkTheme.onPrimary,
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(
        DarkTheme.primary,
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
          color: DarkTheme.primary,
        ),
      ),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: DarkTheme.surface,
    elevation: 3,
    surfaceTintColor: DarkTheme.primary,
    titleTextStyle: TextStyle(
      fontFamily: "Lato",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: DarkTheme.onSurface,
    ),
    contentTextStyle: TextStyle(
      fontFamily: "Lato",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: DarkTheme.onSurfaceVariant,
    ),
    iconColor: DarkTheme.secondary,
    alignment: Alignment.center,
  ),
);
