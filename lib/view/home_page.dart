import 'package:final_todo_list/controller/TODOController.dart';
import 'package:final_todo_list/controller/switchcontroller.dart';
import 'package:final_todo_list/view/add_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchX sx = Get.put(SwitchX());
    TODOController controller = Get.put(TODOController());
    // bool isDark = false;
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(AddTodo());
        },
      ),
      appBar: AppBar(title: Text("TODO APP"),
          actionsIconTheme: IconThemeData(
          size: 30.0,
          color: Colors.black,
          opacity: 10.0
      ),
      ),
      body: SingleChildScrollView(
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
                Obx(
                    () => ListView.separated(shrinkWrap: true,itemBuilder: (BuildContext context, int index) {
                      return  ListTile(

                        title: Text(controller.todos[index].text,
                        style: (controller.todos[index].done) ?  TextStyle(
                          color: Colors.green
                        ) : TextStyle(
                          color: Colors.red
                        ),


                      ), onTap: (){
                          Get.to(AddTodo());//todo
                      },trailing: Checkbox(
                        value: controller.todos[index].done,
                        onChanged: (v){
                          var changed = controller.todos[index];
                          changed.done = v;
                          controller.todos[index] = changed;
                          },
                      ),
                      );
                    }, itemCount: controller.todos.length,
                      separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },

                    )
                ),
              ]
            ),
          ),
      ),

    );
  }
}
