import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';
import 'package:todo/model/todo_model.dart';

class TodoBloc {

  final _model = BehaviorSubject<List<TodoModel>>.seeded([]);

  Stream<List<TodoModel>> todoModel() => _model.stream;

  void addTodo({@required TodoModel model}) {
    var currentValue = _model.value;
    currentValue.add(model);
    _model.add(currentValue);
  }

  void modifyComplete({@required TodoModel model, @required bool mark}) {
    var currentList = _model.value;
    int getIndex = currentList.indexOf(model);
    currentList[getIndex] = TodoModel(task: model.task, isComplete: mark);
    _model.add(currentList);
  }

  void removeTask({@required TodoModel model}) {
    var currentList = _model.value;
    currentList.remove(model);
    _model.add(currentList);
  }
  
  

}