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
}
