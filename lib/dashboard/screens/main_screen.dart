import 'package:flutter/material.dart';

import 'screens.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: widget.currentPage,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Text("Projects"),
              Text("Contact Info"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ProjectsScreen(),
            Container(),
          ],
        ),
      ),
    );
  }
}
