import '../../shared/shared.dart';

class FireStorage {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<String>> loadMultiFileToFireStorage({
    required List<String> filesPath,
    required String folderName,
  }) async {
    List<String> urls = [];

    for (var path in filesPath) {
      String? url = await loadFileToFireStorage(
        localFilePath: path,
        folderName: folderName,
      );
      urls.add(url!);
    }

    return urls;
  }

  Future<String?> loadFileToFireStorage({
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
      return loadedFileUrl;
    } catch (e) {
      Logger.print('load file error $e');
      return null;
    }
  }

  Future<bool> deleteFileFromFireStorage({required String fileURL}) async {
    try {
      await _firebaseStorage.refFromURL(fileURL).delete();
      return true;
    } catch (e) {
      if (kDebugMode) {
        Logger.print('Error in delete file: $e');
      }
      return false;
    }
  }
}
