// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/todo_bloc.dart';
//
// class TodoScreen extends StatelessWidget {
//   const TodoScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todos'),
//       ),
//       body: Center(
//         child: BlocBuilder<TodoBloc, TodoState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () => const Text('Press the button to fetch todos'),
//               loading: () => const CircularProgressIndicator(),
//               loaded: (todos) => ListView.builder(
//                 itemCount: todos.length,
//                 itemBuilder: (context, index) {
//                   final todo = todos[index];
//                   return ListTile(
//                     title: Text(todo.title ?? ''),
//                     trailing: Icon(
//                       todo.completed ?? false ? Icons.check : Icons.close,
//                       color:
//                           todo.completed ?? false ? Colors.green : Colors.red,
//                     ),
//                   );
//                 },
//               ),
//               error: (message) => Text('Error: $message'),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         heroTag: null,
//         onPressed: () {
//           context.read<TodoBloc>().add(const TodoEvent.fetchTodos());
//         },
//         child: const Icon(Icons.download),
//       ),
//     );
//   }
// }
