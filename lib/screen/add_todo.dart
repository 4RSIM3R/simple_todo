import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/model/todo_model.dart';

// ignore: must_be_immutable
class AddTodo extends StatelessWidget {

  String value;
  TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    var todoBloc = Provider.of<TodoBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Add Task'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                onChanged: (String val) => value = val,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Add Your Task',
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  todoModel = TodoModel(task: value, isComplete: false);
                  todoBloc.addTodo(model: todoModel);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[200].withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
