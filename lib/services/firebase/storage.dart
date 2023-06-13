import '../../shared/packages.dart';

class FireStorage {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Future<String> loadFileToFireStorage({
    required String localFilePath,
    required String folderName,
  }) async {
    String loadedFileUrl = '';

    try {
      File file = File(localFilePath);
      String fileName = basename(file.path);

      Reference storageRef = _firebaseStorage.ref(folderName).child(fileName);

      await storageRef.putFile(file);
      loadedFileUrl = await storageRef.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print('Error in load file: $e');
      }
    }

    return loadedFileUrl;
  }

  Future<bool> deleteFileFromFireStorage({required String fileURL}) async {
    try {
      await _firebaseStorage.refFromURL(fileURL).delete();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error in delete file: $e');
      }
      return false;
    }
  }
}
