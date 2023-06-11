import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  int _selectedCoverImage = 0;
  final List<String> _projectImages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (String image in _projectImages)
                  ImageContainer(
                    isCoverImage:
                        _selectedCoverImage == _projectImages.indexOf(image),
                    onSelectImage: () {
                      setState(() {
                        _selectedCoverImage = _projectImages.indexOf(image);
                      });
                    },
                    image: image,
                    onDelete: () async {
                      // if (!image.startsWith('http')) {
                      //   await _firebaseDatabase.deleteFileFromFireStorage(
                      //       fileURL: image);
                      // }
                      // _productImages.remove(image);
                      // _selectedCoverImage = 0;
                      setState(() {});
                    },
                  ),
                ImagePickerButton(
                  onTap: () async {
                    // if (await Permission.storage.request().isGranted) {
                    //   final XFile? selectedImage =
                    //       await ImagePicker().pickImage(
                    //     source: ImageSource.gallery,
                    //     imageQuality: 25,
                    //   );
                    //   if (selectedImage != null) {
                    //     setState(() {
                    //       _productImages.add(selectedImage.path);
                    //     });
                    //   }
                    // }
                  },
                ),
              ],
            ),
          ),
          BeautyTextField(
            fieldName: 'Project Name',
            textInputType: TextInputType.name,
          ),
          BeautyTextField(
            fieldName: 'Code Url',
          ),
          BeautyTextField(
            fieldName: 'App Url',
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
