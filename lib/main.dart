
import 'package:final_todo_list/theme/themes.dart';
import 'package:final_todo_list/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,
    theme: Themes().lightTheme,
    darkTheme: Themes().darkTheme,);
  }
}