import 'package:flutter/material.dart';

import 'widgets.dart';

class ContactUrlField extends StatefulWidget {
  final String fieldName;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  const ContactUrlField(
      {super.key, required this.fieldName, this.prefixIcon, this.controller});

  @override
  State<ContactUrlField> createState() => _ContactUrlFieldState();
}

class _ContactUrlFieldState extends State<ContactUrlField> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BeautyTextField(
            fieldName: widget.fieldName,
            prefixIcon: Icon(widget.prefixIcon),
            enabled: _isEnabled,
            controller: widget.controller,
          ),
        ),
        IconButton(
          onPressed: () async {
            if (_isEnabled) {
              // await _firebaseServices.updatePageUrl(
              //   url: widget.controller!.text,
              //   docId: widget.docId,
              // );
              // print('Page Url update');
            }
            setState(() {
              _isEnabled = !_isEnabled;
            });
          },
          icon: _isEnabled
              ? const Icon(
                  Icons.done,
                  color: Colors.blue,
                )
              : const Icon(Icons.edit),
        ),
      ],
    );
  }
}
