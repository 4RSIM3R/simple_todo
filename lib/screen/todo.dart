import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/component/todo_component.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/screen/add_todo.dart';

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todoBloc = Provider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Todo List'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: StreamBuilder<List<TodoModel>>(
          stream: todoBloc.todoModel(),
          builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
            if(snapshot.data.length == 0) {
              return Center(
                child: Text("You Don't Have Task"),
              );
            }
            return ReorderableListView(
              children: _generateTodoItemWidget(snapshot.data),
              onReorder: (int oldIndex, newIndex) {
                final TodoModel item = snapshot.data.removeAt(oldIndex);
                todoBloc.addTodo(model: item);
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodo())),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

List<Widget> _generateTodoItemWidget(List<TodoModel> values) {
  
  List<Widget> items = [];
  
  values.forEach((todoModel) { 
    items.add(TodoComponent(key: ValueKey(todoModel.task), todoModel: todoModel));
  });
  
  return items;
  
}
