import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/model/todo_model.dart';

class TodoComponent extends StatefulWidget {

  final TodoModel todoModel;

  const TodoComponent({Key key, @required this.todoModel}) : super(key: key);

  @override
  _TodoComponentState createState() => _TodoComponentState();
}

class _TodoComponentState extends State<TodoComponent> {
  @override
  Widget build(BuildContext context) {
    var todoBloc = Provider.of<TodoBloc>(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: 4,
        top: 6,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 2,
            offset: Offset(2, 2),
          )
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(widget.todoModel.task),
        leading: Checkbox(value: widget.todoModel.isComplete, onChanged: (bool val) {
          setState(() => todoBloc.modifyComplete(model: widget.todoModel, mark: val));
        }),
        trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () => todoBloc.removeTask(model: widget.todoModel)),
      ),
    );
  }
}
