import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar tugas (todo list)
  List<TodoModel> todos = [];

  // Controller untuk input text
  final TextEditingController _controller = TextEditingController();

  // Fungsi menambah todo
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        todos.add(TodoModel(title: _controller.text));
        _controller.clear();
      });
    }
  }

  // Fungsi menghapus todo
  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Input text untuk todo
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Add a new todo',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addTodo(),
            ),
            const SizedBox(height: 10),

            // Tombol tambah todo
            ElevatedButton(onPressed: _addTodo, child: const Text('Add Todo')),
            const SizedBox(height: 10),

            // Daftar todo
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.done ? 'Done' : 'Not Done'),
                    leading: Icon(todo.done ? Icons.check : Icons.schedule),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteTodo(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
