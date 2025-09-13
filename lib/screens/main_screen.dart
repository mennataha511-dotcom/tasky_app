import 'package:flutter/material.dart';
import 'my_task.dart';
import 'to_do.dart';
import 'completed.dart';
import 'profile.dart';
import '../custom/custom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  final String? savedName;

  const MainScreen({super.key, this.savedName});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MyTask(savedName: widget.savedName, userName: ''),
      const ToDo(),
      const Completed(),
      const Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
