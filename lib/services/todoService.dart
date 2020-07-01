import 'package:teste_framework/app/models/todo.dart';
import 'package:teste_framework/repositories/todoRepository.dart';
import 'package:teste_framework/services/abstractService.dart';

class TodoService extends AbstractService {
  final TodoRepository _todoRepository = TodoRepository();

  TodoService () {
    uri = baseUri + '/todos';
  }

  @override
  bool shouldSync() {
    return true;
  }

  @override
  void sync() async {
    var todos = await getTodos();
    var existentTodos = await _todoRepository.getWhereIn('id', todos.map((todo) => todo.getId()).toList());
    todos.forEach((todo) {
      if(existentTodos.isNotEmpty) {
        var existentTodo = existentTodos.firstWhere((existentTodo) => existentTodo.getId() == todo.getId());
        if(existentTodo != null) {
          todo = existentTodo.update(todo);
        }
      }

      _todoRepository.save(todo);
    });
  }

  Future<List<Todo>> getTodos() async {
    var todos = await fetch();
    return todos.map((todo) => Todo.fromJson(todo)).toList();
  }
}