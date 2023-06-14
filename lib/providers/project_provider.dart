import '../models/models.dart';
import '../services/servers.dart';
import '../shared/shared.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> projects = [];
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  init() async {
    projects = await _firebaseDatabase.getProjectsData();
    Logger.print('${projects.length}');
    notifyListeners();
  }

  Future addProject(Project project) async {
    await _firebaseDatabase.addNewProject(project);
    projects.add(project);
    notifyListeners();
  }
}
