// import 'dart:io';

// import 'package:path/path.dart';

// class FirebaseServices {
//   final CollectionReference<Map<String, dynamic>> _webViewUrls =
//       FirebaseFirestore.instance.collection('web_view_urls');

//   final CollectionReference<Map<String, dynamic>> _ads =
//       FirebaseFirestore.instance.collection('ads');

//   final CollectionReference<Map<String, dynamic>> _apps =
//       FirebaseFirestore.instance.collection('apps');
//   final CollectionReference<Map<String, dynamic>> _appData =
//       FirebaseFirestore.instance.collection('app_data');

//   final CollectionReference<Map<String, dynamic>> _adsData =
//       FirebaseFirestore.instance.collection('ads_data');
//   signInAnonymously() async {
//     try {
//       await FirebaseAuth.instance.signInAnonymously();
//       print("Signed in with temporary account.");
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case "operation-not-allowed":
//           print("Anonymous auth hasn't been enabled for this project.");
//           break;
//         default:
//           print("Unknown error.");
//       }
//     }
//   }

//   Future updatePageUrl({
//     required String url,
//     required String docId,
//   }) async {
//     try {
//       await _webViewUrls.doc(docId).set({
//         "page_url": url,
//       });

//       if (kDebugMode) {
//         print("Update succeeded");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("error while update users Location: $e");
//       }
//     }
//   }

//   Future<List<String>> getUrls() async {
//     List<String> urls = [];
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await _webViewUrls.get();
//       for (var element in querySnapshot.docs) {
//         urls.add(element.data()["page_url"]);
//       }
//     } catch (e) {
//       print("Error in get urls: $e");
//     }
//     return urls;
//   }

//   Future<bool> areAdsAppear() async {
//     bool areAppear = true;
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot = await _ads.get();
//       areAppear = querySnapshot.docs.first.data()['are_appear'];
//     } catch (e) {
//       print("Error in get urls: $e");
//     }
//     return areAppear;
//   }

//   Future changeAdsAppearStatus({required bool status}) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot = await _ads.get();
//       await _ads.doc('1234567890').set({
//         "are_appear": status,
//       });

//       if (kDebugMode) {
//         print("Update succeeded");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("error while update ads status: $e");
//       }
//     }
//   }

//   Future updateAppData({
//     required String about,
//     required String privacy,
//   }) async {
//     try {
//       await _appData.doc('1234567890').set({
//         'about': about,
//         'privacy': privacy,
//       });

//       if (kDebugMode) {
//         print("Update succeeded");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("error while update data: $e");
//       }
//     }
//   }

//   Future<Map<String, dynamic>> getAppData() async {
//     Map<String, dynamic> data = {};
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot = await _appData.get();

//       data = querySnapshot.docs.first.data();
//     } catch (e) {
//       print("Error in get urls: $e");
//     }
//     return data;
//   }

//   Future setNotificationImage({required String imageUrl}) async {
//     await _appData.doc('1234567890').update({
//       'notification_image': imageUrl,
//     });
//   }

//   Future<List<Map<String, dynamic>>> getAppsData() async {
//     List<Map<String, dynamic>> listOfData = [];
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await _apps.orderBy('index').get();

//       for (var element in querySnapshot.docs) {
//         listOfData.add(element.data());
//       }
//     } catch (e) {
//       print("error in get : $e");
//     }
//     return listOfData;
//   }

//   Future<bool> addAppData(AppModule appModule) async {
//     try {
//       await _apps.doc(appModule.docId).set({
//         'app_name': appModule.name,
//         'icon_url': appModule.image,
//         'id': appModule.appId,
//         'index': appModule.index,
//         'docId': appModule.docId,
//       });
//       return true;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error in : $e");
//       }
//       return false;
//     }
//   }

//   Future<int> deleteAppData({
//     required String docId,
//   }) async {
//     try {
//       await _apps.doc(docId).delete();
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error in : $e");
//       }
//     }

//     return 0;
//   }

//   Future<Map<String, dynamic>?> getAdsData() async {
//     Map<String, dynamic> adData;
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot = await _adsData.get();
//       adData = querySnapshot.docs.first.data();
//       return adData;
//     } catch (e) {
//       print("error in get : $e");
//       return null;
//     }
//   }

//   Future<bool> addAdData(AdModule adModule) async {
//     try {
//       await _adsData.doc(adModule.id).set({
//         'title': adModule.title,
//         'image': adModule.image,
//         'id': adModule.id,
//         'desc': adModule.desc,
//         'url': adModule.url,
//       });
//       return true;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error in : $e");
//       }
//       return false;
//     }
//   }

//   Future<int> deleteAdData({
//     required String docId,
//   }) async {
//     try {
//       await _adsData.doc(docId).delete();
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error in : $e");
//       }
//     }

//     return 0;
//   }

//   Future<String> loadFileToFireStorage({required String localFilePath}) async {
//     String fileLink = '';
//     File file = File(localFilePath);
//     try {
//       String fileName = basename(file.path);

//       Reference storageRef =
//           FirebaseStorage.instance.ref('images').child(fileName);

//       await storageRef.putFile(file);
//       fileLink = await storageRef.getDownloadURL();
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error in load image: $e');
//       }
//     }

//     return fileLink;
//   }
// }
