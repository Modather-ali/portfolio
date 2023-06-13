import '../../models/models.dart';
import '../../shared/packages.dart';

class FirebaseDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _projects =
      FirebaseFirestore.instance.collection('projects');

  Future<List<Map<String, dynamic>>> getProjectsData(
      String collectionID) async {
    List<Map<String, dynamic>> listOfData = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection(collectionID).get();

      for (var element in querySnapshot.docs) {
        listOfData.add(element.data());
      }
    } catch (e) {
      print("error in get date: $e");
    }
    return listOfData;
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
