import '../../shared/packages.dart';

class FireStorage {
  Future<String> loadFileToFireStorage({
    required String localFilePath,
    required String folderName,
  }) async {
    String landFileLink = '';
    File file = File(localFilePath);
    try {
      String fileName = basename(file.path);

      Reference storageRef =
          FirebaseStorage.instance.ref(folderName).child(fileName);

      await storageRef.putFile(file);
      landFileLink = await storageRef.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print('Error in load image: $e');
      }
    }

    return landFileLink;
  }

  Future<bool> deleteFileFromFireStorage({required String fileURL}) async {
    try {
      await FirebaseStorage.instance.refFromURL(fileURL).delete();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error in delete file: $e');
      }
      return false;
    }
  }
}
