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
  final List<String> _selectedSkills = [];
  final List<String> _allSkills = [
    'Flutter',
    'Dart',
    'Firebase',
    'Git',
    'State Management',
    'API',
    'SQL Lite',
    'Php',
    'Google Maps',
    'Payment',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _codeUrl = TextEditingController();
  final TextEditingController _appUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _onSave,
            icon: Icon(
              Icons.save,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
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
              controller: _name,
              textInputType: TextInputType.name,
            ),
            BeautyTextField(
              fieldName: 'Project Description',
              controller: _desc,
              textInputType: TextInputType.text,
            ),
            BeautyTextField(
              fieldName: 'Code Url',
              controller: _codeUrl,
            ),
            BeautyTextField(
              fieldName: 'App Url',
              controller: _appUrl,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 10),
            Text(
              "Used Skills",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blue,
                  ),
            ),
            Wrap(
              children: [
                for (int i = 0; i < _allSkills.length; i++)
                  ChoiceSkillChip(
                    skillName: _allSkills[i],
                    selected: _selectedSkills.contains(_allSkills[i]),
                    onSelected: (p0) {
                      if (_selectedSkills.contains(_allSkills[i])) {
                        setState(() => _selectedSkills.remove(_allSkills[i]));
                      } else {
                        setState(() => _selectedSkills.add(_allSkills[i]));
                      }
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    _formKey.currentState!.validate();
  }
}
