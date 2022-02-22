import 'package:final_todo_list/model/TODOModel.dart';
import 'package:get/get.dart';

class TODOController extends GetxController
{
  var todos = [].obs;
  var todo2 = [].obs;
  var index2 = 0;
  void searchForTODo(String text)
  {
    index2 = 0;
    todos.forEach((element) {
     var c = element as TODO;
     if(c.text.contains(text))
       {
         todo2.insert(index2,  text);
         index2 = index2 + 1;
       }
    },);
  }
}