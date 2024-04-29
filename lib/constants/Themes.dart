import 'package:flutter/material.dart';

class AppColors1 {
  AppColors1._();

  static const Color primaryColor = Color(0xFFFFDE59); // 主色调
  static const Color primaryColor2 = Color(0xCCFFDE59);
  static const Color primaryColor3 = Color(0x59FFDE59);
  static const Color secondaryColor = Color(0xffCCD6DD); // 辅助色
  static const Color accentColor = Color(0xff00008b); // 强调色
  static const Color backgroundColor = Color(0xFFFFFFFF); // 背景色
  static const Color textColor = Color(0xff737373); // 文本颜色
}

class AppText {
  AppText._();

  static const TextStyle bgStandard = TextStyle(color:AppColors1.backgroundColor,fontSize: 16);
  static const TextStyle pStandard = TextStyle(color:AppColors1.primaryColor,fontSize: 16);
  static const TextStyle Standard = TextStyle(color:AppColors1.textColor,fontSize: 16);
  static const TextStyle Small = TextStyle(color:AppColors1.textColor,fontSize: 12);
  static const TextStyle Big = TextStyle(color:AppColors1.textColor,fontSize: 16);
}

class AppButton{
  static final ButtonStyle button1 = ElevatedButton.styleFrom(
    backgroundColor:AppColors1.primaryColor,
    foregroundColor:AppColors1.backgroundColor,
    textStyle:AppText.bgStandard,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.zero)
  );
  static final ButtonStyle button2 = ElevatedButton.styleFrom(
      backgroundColor:AppColors1.backgroundColor,
      foregroundColor:AppColors1.primaryColor,
      textStyle:AppText.bgStandard,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.zero)
  );
  static final ButtonStyle button3 = ElevatedButton.styleFrom(
      //backgroundColor:AppColors1.primaryColor3,
      shadowColor:AppColors1.primaryColor2,
      foregroundColor:AppColors1.textColor,
      textStyle:AppText.Small
  );
}