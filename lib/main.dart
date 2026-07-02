import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/screens/app.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_event.dart';
import 'features/home/repository/home_repository.dart';

void main() {
  final repository = HomeRepository();

  runApp(
    RepositoryProvider.value(
      value: repository,
      child: BlocProvider(
        create: (_) => UserBloc(repository: repository)..add(const UserFetchRequested()),
        child: const MainApp(),
        
      ),
    ),
  );
}
