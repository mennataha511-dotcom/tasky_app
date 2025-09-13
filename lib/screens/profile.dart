import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_3/screens/user_details.dart';
import '../logic/task_controller_bloc.dart';
import '../logic/task_controller_event.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = '';
  String quote = '';

  @override
  void initState() {
    super.initState();
    context.read<TaskControllerBloc>().add(const LoadTasks());
    getUserData();
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      quote = prefs.getString('quote') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, _) {
        bool isDark = currentTheme == ThemeMode.dark;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
          appBar: AppBar(
            title: const Text("My Profile"),
            leading: const BackButton(),
            backgroundColor: isDark ? const Color(0xFF181818) : Colors.white,
            iconTheme: IconThemeData(
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: isDark
                          ? Colors.grey[800]
                          : Colors.grey[200],
                      backgroundImage: const AssetImage("assets/profile.jpeg"),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: isDark ? Colors.grey[700] : Colors.white,
                      child: SvgPicture.asset(
                        'assets/camera.svg',
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 20),
                ),
                Text(quote, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      "Profile Info",
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 20),
                    ),
                  ],
                ),

                ListTile(
                  tileColor: isDark ? const Color(0xFF1E1E1E) : Colors.grey[100],
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserDetails(),
                      ),
                    );
                    if (result == true) {
                      getUserData();
                    }
                  },
                  leading: SvgPicture.asset(
                    'assets/profile.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    "User Details",
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(fontSize: 20),
                  ),
                  trailing: SvgPicture.asset(
                    'assets/arrow-right.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const Divider(indent: 20, endIndent: 20),

                ListTile(
                  tileColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.grey[100],
                  leading: SvgPicture.asset(
                    'assets/moon.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    isDark ? "Dark Mode" : "Light Mode",
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(fontSize: 20),
                  ),
                  trailing: Switch(
                    value: isDark,
                    onChanged: (value) async {
                      themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool("isDark", value);
                    },
                    // from high priority in new task page
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.white38,
                  ),
                ),
                const Divider(indent: 20, endIndent: 20),

                ListTile(
                  tileColor: isDark ? const Color(0xFF1E1E1E) : Colors.grey[100],
                  leading: SvgPicture.asset(
                    'assets/logout.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    "Log Out",
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(fontSize: 20),
                  ),
                  trailing: SvgPicture.asset(
                    'assets/arrow-right.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
