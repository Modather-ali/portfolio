import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/uri_luncher.dart';
import '../shared/constants.dart';
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
                onPressed: () {
                  UrlLuncher.lunchUrl(Constants.githubUrl);
                },
                icon: FontAwesomeIcons.github,
                color: Colors.black,
              ),
              ContactButton(
                onPressed: () {
                  UrlLuncher.lunchUrl(Constants.email);
                },
                icon: Icons.email,
                color: Colors.grey,
              ),
              ContactButton(
                onPressed: () {
                  UrlLuncher.lunchUrl(Constants.whatsappUrl);
                },
                icon: FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
              ContactButton(
                onPressed: () {
                  UrlLuncher.lunchUrl(Constants.linkedinInUrl);
                },
                icon: FontAwesomeIcons.linkedinIn,
                color: Colors.blueGrey,
              ),
              ContactButton(
                onPressed: () {
                  UrlLuncher.lunchUrl(Constants.telegramUrl);
                },
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
