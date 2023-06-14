import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/servers.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> projects = [];
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  init() async {
    projects = await _firebaseDatabase.getProjectsData();
    notifyListeners();
  }

  Future addProject(Project project) async {
    await _firebaseDatabase.addNewProject(project);
    projects.add(project);
    notifyListeners();
  }
}
