import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:fastguard/todos/todos_repository/todos_repository.dart';
import 'package:fastguard/todos/blocs/blocs.dart';
import 'package:fastguard/todos/pages/pages.dart';
//import 'package:user_repository/user_repository.dart';
import 'package:fastguard/core/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(TodosApp());
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosBloc>(
      create: (context) {
        return TodosBloc(
          todosRepository: TodosRepository(),
        )..add(LoadTodos());
      },
      child: MaterialApp(
        
        routes: {
          '/': (context) {
            return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabBloc>(
                        create: (context) => TabBloc(),
                      ),
                      BlocProvider<FilteredTodosBloc>(
                        create: (context) => FilteredTodosBloc(
                          todosBloc: BlocProvider.of<TodosBloc>(context),
                        ),
                      ),
                      BlocProvider<StatsBloc>(
                        create: (context) => StatsBloc(
                          todosBloc: BlocProvider.of<TodosBloc>(context),
                        ),
                      ),
                    ],
                    child: Home(),
                  );
                }
      
              ,
            
          
          '/addTodo': (context) {
            return AddEditPage(
              onSave: (task, note) {
                BlocProvider.of<TodosBloc>(context).add(
                  AddTodo(Todo(task, note: note)),
                );
              },
              isEditing: false,
            );
          },
        }
      ),
    );
  }
}
