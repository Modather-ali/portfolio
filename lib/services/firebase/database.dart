import '../../models/models.dart';
import '../../shared/packages.dart';

class FirebaseDatabase {
  final CollectionReference<Map<String, dynamic>> _projects =
      FirebaseFirestore.instance.collection('projects');

  Future<List<Project>> getProjectsData() async {
    List<Project> listOfProjects = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _projects.get();

      for (var element in querySnapshot.docs) {
        listOfProjects.add(Project.fromJson(element.data()));
      }
    } catch (e) {
      print("error in get date: $e");
    }
    return listOfProjects;
  }

  Future<bool> addNewProject(Project project) async {
    try {
      await _projects.doc(project.id).set(project.toJson());
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error in adding data: $e");
      }
      return false;
    }
  }

  Future<bool> updateProject(Project project) async {
    try {
      await _projects.doc(project.id).set(project.toJson());
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error in update : $e");
      }
      return false;
    }
  }

  Future<bool> deleteProject(String id) async {
    try {
      await _projects.doc(id).delete();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error in delete: $e");
      }
      return false;
    }
  }
}