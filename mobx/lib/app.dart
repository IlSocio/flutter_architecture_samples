// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:mobx/localization.dart';
import 'package:mobx/screens/add_edit_screen.dart';
import 'package:mobx/screens/home_screen.dart';
import 'package:mobx/viewmodels/todo_list_model.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:todos_repository_core/todos_repository_core.dart';

class MobxApp extends StatelessWidget {
  final TodosRepository repository;

  MobxApp({
    @required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      title: MobxLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        MobxLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) => HomeScreen(),
        ArchSampleRoutes.addTodo: (context) => AddEditScreen(),
      },
    );

    return ChangeNotifierProvider(
      builder: (context) => TodoListModel(
        repository: repository,
      ),
      child: app,
    );
  }
}
