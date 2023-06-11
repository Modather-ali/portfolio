import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

class ContactMeBuilder extends StatelessWidget {
  const ContactMeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Contact Me"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.github,
                color: Colors.black,
              ),
              ContactButton(
                onPressed: () {},
                icon: Icons.email,
                color: Colors.grey,
              ),
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.linkedinIn,
                color: Colors.blueGrey,
              ),
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.telegram,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
