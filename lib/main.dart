import 'dart:developer';

import 'package:bloc_prcatice/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_integration_bloc_freezed/bloc/todo_bloc.dart';
import 'api_integration_bloc_freezed/screens/todo_screen.dart';
import 'api_integration_bloc_freezed/service/todo_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('build called');
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
            create: (context) =>
                TodoBloc(ApiService('https://jsonplaceholder.typicode.com'))),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextFormField(
            //   onChanged: (value) {
            //
            //   },
            // ),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(listener: (context, state) {
              if (state.count == 5) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Hello, ${state.count}!'),
                  ),
                );
              }
            }, builder: (context, state) {
              return Text(
                '_counter ${state.count}',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
              );
            }),
            FilledButton(
                onPressed: () {
                  // BlocProvider.of<CounterBloc>(context).add(ShowSnackBar()),

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoScreen()));
                },
                child: Text('Show snack'))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment(userInput: 2));
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              context.read<CounterBloc>().add(Reset());
            },
            child: const Icon(Icons.restart_alt_rounded),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              // context.read<CounterBloc>().add(Decrement());
              BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
