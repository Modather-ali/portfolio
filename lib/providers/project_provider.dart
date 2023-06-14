import '../models/models.dart';
import '../services/servers.dart';
import '../shared/shared.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> projects = [];
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  Future<bool> init() async {
    try {
      projects = await _firebaseDatabase.getProjectsData();
      Logger.print('${projects.length}');
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future addProject(Project project) async {
    await _firebaseDatabase.addNewProject(project);
    projects.add(project);
    notifyListeners();
  }

  Future deleteProject(Project project) async {
    await _firebaseDatabase.deleteProject(project.id);
    projects.remove(project);
    notifyListeners();
  }
}
