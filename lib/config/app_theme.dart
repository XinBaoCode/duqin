import 'package:flutter/material.dart';
import 'package:wangyiyun/config/app_colors.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary, // 主题色
  scaffoldBackgroundColor: AppColors.page, // 页面背景颜色
  splashColor: Colors.transparent, // 取消水波纹的效果
  highlightColor: Colors.transparent, // 取消水波纹效果
  // 文字颜色
  textTheme: const TextTheme(
      bodyText2: TextStyle(
    color: AppColors.unactive,
  )),
  // 底部按钮主题
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor: AppColors.active,
    unselectedItemColor: AppColors.unactive,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  ),
);
