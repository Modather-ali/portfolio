import 'package:flutter/material.dart';
import 'package:portfolio/providers/providers.dart';

import '../../models/models.dart';
import '../../services/servers.dart';
import '../../shared/packages.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  late Project _project;
  int _selectedCoverImage = 0;
  final List<String> _projectImages = [];
  final List<String> _selectedSkills = [];
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  final FireStorage _fireStorage = FireStorage();

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

  late ProjectProvider _projectProvider;
  @override
  Widget build(BuildContext context) {
    _projectProvider = Provider.of<ProjectProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _saveProject(context);
            },
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
                        if (!image.startsWith('http')) {
                          await _fireStorage.deleteFileFromFireStorage(
                              fileURL: image);
                        }
                        _projectImages.remove(image);
                        _selectedCoverImage = 0;
                        setState(() {});
                      },
                    ),
                  ImagePickerButton(
                    onTap: () async {
                      if (await Permission.storage.request().isGranted) {
                        final XFile? selectedImage =
                            await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 75,
                        );
                        if (selectedImage != null) {
                          setState(
                              () => _projectImages.add(selectedImage.path));
                        }
                      }
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
                        _selectedSkills.remove(_allSkills[i]);
                      } else {
                        _selectedSkills.add(_allSkills[i]);
                      }
                      setState(() {});
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveProject(BuildContext context) async {
    List<String> images = [];
    if (_formKey.currentState!.validate()) {
      if (_projectImages.isNotEmpty) {
        images = await _fireStorage.loadMultiFileToFireStorage(
          filesPath: _projectImages,
          folderName: _name.text,
        );
        _project = Project(
          id: 'project-${_name.text.hashCode}-${_desc.text.hashCode}',
          name: _name.text,
          description: _desc.text,
          codeUrl: _codeUrl.text,
          appUrl: _appUrl.text,
          coverImage: _selectedCoverImage,
          images: images,
          usedSkills: _selectedSkills,
        );
        await _projectProvider.addProject(_project);
      }
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false);
  }
}
