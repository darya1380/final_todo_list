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
        child: const Icon(Icons.add),
        onPressed: (){
          Get.to(AddTodo());
        },
      ),
      appBar: AppBar(title: const Text("TODO APP"),
          actionsIconTheme: const IconThemeData(
          size: 30.0,
          color: Colors.black,
          opacity: 10.0,
      ),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) =>  SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(12),
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
                        style: (controller.todos[index].done) ?  const TextStyle(
                          color: Colors.green
                        ) : const TextStyle(
                          color: Colors.red
                        ),


                      ), onTap: (){
                          Get.to(AddTodo());
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
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  TODOController controller = Get.put(TODOController());
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [ TextField(
                style: const TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.searchForTODo(myController.text);
                        //show all todos
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
              Obx(
                      () => ListView.separated(shrinkWrap: true,itemBuilder: (BuildContext context, int index) {
                    return  ListTile(

                      title: Text(controller.todos[index].text,
                        style: (controller.todos[index].done) ?  const TextStyle(
                            color: Colors.green
                        ) : const TextStyle(
                            color: Colors.red
                        ),


                      ), onTap: (){
                      Get.to(AddTodo());
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
              ),]
            ),
          )),
    );
  }
}
