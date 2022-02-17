import 'package:final_todo_list/controller/TODOController.dart';
import 'package:final_todo_list/controller/switchcontroller.dart';
import 'package:final_todo_list/model/TODOModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddTodo extends StatelessWidget {
   AddTodo({Key? key}) : super(key: key);
  final TODOController todoController = Get.find();
  @override
  Widget build(BuildContext context) {
    SwitchX sx = Get.put(SwitchX());
    TextEditingController textEditingController = TextEditingController();

    bool isDark = false;
    return Scaffold(
      appBar: AppBar(title: Text("TODO APP"),),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
              children: [
                Obx(() => Switch(onChanged: (bool value) {
                  Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light: ThemeMode.dark);
                  sx.toggle();

                }, value: sx.on.value,
                ),
                  // child: MaterialButton(
                  //   onPressed: (){
                  //     Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light: ThemeMode.dark);
                  //   }, child: Text("switch theme"),
                  // ),
                  // ]

                ),
                 TextField(
                  controller: textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "What do you want to accomplish",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLength: 999,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RaisedButton(
                      child: Text("cancel"),
                      color: Colors.red,
                      onPressed: (){
                        Get.back();
                      },
                    ),
                    RaisedButton(onPressed: (){
                      print("hello");
                      print('$todoController.todos');
                    // todoController.todos.add(TODO(textEditingController.text, false));
                      print('new task added');
                    Get.back();
                    },
                      child: Text("add"), color: Colors.green,)
                  ], //children

                )
              ]
          ),
        ),
      ),
    );
  }
}
