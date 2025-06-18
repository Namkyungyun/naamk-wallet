import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColor.brand80,
      primaryColorLight: AppColor.brand80,
      primaryColorDark: AppColor.brand90,
      focusColor: AppColor.grey20,
      disabledColor: AppColor.grey50,
      appBarTheme: AppBarTheme(
          elevation: 2,
          iconTheme: IconThemeData(color: AppColor.brand100),
          backgroundColor: AppColor.backgroundLight,
          titleTextStyle: TextStyle(
            color: AppColor.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: AppColor.backgroundLight,
              statusBarColor: AppColor.backgroundLight,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark)),
      scaffoldBackgroundColor: AppColor.backgroundLight,
      cardColor: AppColor.cardLight,
      cardTheme: CardTheme(
        color: AppColor.cardLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: AppColor.dividerLight, // ✅ 테두리 색상
            width: 0.5, // ✅ 테두리 두께
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(
        horizontalTitleGap: 12,
        minTileHeight: 40,
        minVerticalPadding: 8,
        tileColor: AppColor.listTileLight,
        selectedTileColor: AppColor.selectedListTileLight,
        visualDensity: VisualDensity.compact,
        selectedColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: AppColor.dividerLight, // ✅ 테두리 색상
            width: 0.5, // ✅ 테두리 두께
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        titleTextStyle: TextStyle(
          color: AppColor.grey80,
        ),
        iconColor: AppColor.listTileIconLight,
        textColor: AppColor.grey90,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.bottomNavbarBackground,
        elevation: 8,
        selectedItemColor: AppColor.selectedBottomItem,
        unselectedItemColor: AppColor.unselectedBottomItem,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      dividerColor: AppColor.dividerLight,
      splashColor: AppColor.transparent,
      iconTheme: IconThemeData(color: AppColor.brand100),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: AppColor.brand80),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: AppColor.brand60,
        disabledColor: AppColor.inactiveLight,
        highlightColor: AppColor.activeLight,
      ),
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColor.black,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColor.brand60,
      primaryColorLight: AppColor.brand60,
      primaryColorDark: AppColor.brand70,
      disabledColor: AppColor.grey60,
      focusColor: AppColor.grey70,
      appBarTheme: AppBarTheme(
          elevation: 2,
          iconTheme: IconThemeData(color: AppColor.brand30),
          backgroundColor: AppColor.backgroundDark,
          titleTextStyle: TextStyle(
            color: AppColor.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: AppColor.backgroundDark,
              statusBarColor: AppColor.backgroundDark,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light)),
      scaffoldBackgroundColor: AppColor.backgroundDark,
      cardColor: AppColor.cardDark,
      cardTheme: CardTheme(
        color: AppColor.cardDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: AppColor.dividerDark, // ✅ 테두리 색상
            width: 0.5, // ✅ 테두리 두께
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(
        horizontalTitleGap: 12,
        minVerticalPadding: 8,
        minTileHeight: 40,
        tileColor: AppColor.listTileDark,
        selectedTileColor: AppColor.selectedListTileDark,
        visualDensity: VisualDensity.compact,
        selectedColor: AppColor.grey80,
        titleTextStyle: TextStyle(
          color: AppColor.white,
        ),
        iconColor: AppColor.listTileIconDark,
        textColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: AppColor.dividerDark, // ✅ 테두리 색상
            width: 0.5, // ✅ 테두리 두께
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.bottomNavbarBackgroundDark,
        elevation: 8,
        selectedItemColor: AppColor.selectedBottomItemDark,
        unselectedItemColor: AppColor.unselectedBottomItemDark,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      dividerColor: AppColor.dividerDark,
      splashColor: AppColor.transparent,
      iconTheme: IconThemeData(color: AppColor.white),
      fontFamily: 'Raleway',
      textTheme: ThemeData.dark().textTheme,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: AppColor.brand80),
      buttonTheme: ButtonThemeData(
        disabledColor: AppColor.inactiveDark,
        highlightColor: AppColor.activeDark,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: AppColor.brand60,
      ),
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
      ),
    );
  }
}
