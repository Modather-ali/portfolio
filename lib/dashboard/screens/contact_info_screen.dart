import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
      children: const [
        ContactUrlField(
          fieldName: 'GitHub',
          prefixIcon: FontAwesomeIcons.github,
        ),
        ContactUrlField(
          fieldName: 'Email',
          prefixIcon: Icons.email,
        ),
        ContactUrlField(
          fieldName: 'WhatsApp',
          prefixIcon: FontAwesomeIcons.whatsapp,
        ),
        ContactUrlField(
          fieldName: 'linkedin In',
          prefixIcon: FontAwesomeIcons.linkedinIn,
        ),
        ContactUrlField(
          fieldName: 'Telegram',
          prefixIcon: FontAwesomeIcons.telegram,
        ),
      ],
    );
  }
}
