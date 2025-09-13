import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_task.dart';

class AppPage extends StatelessWidget {
  AppPage({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/logo.svg'),
                  const SizedBox(width: 16),
                  Text(
                    'Tasky',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),

              const SizedBox(height: 108),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To Tasky ',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset('assets/hand.svg'),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                "Your productivity journey starts here.",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(fontSize: 16),
              ),

              const SizedBox(height: 24),

              SvgPicture.asset('assets/photo1.svg'),

              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Full Name",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _nameController,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "e.g. Sarah Khalid",
                        ),
                      ),

                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: () async {
                          String name = _nameController.text.trim();
                          if (_key.currentState!.validate() &&
                              name.isNotEmpty) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString("userName", name);

                            final currentContext = context;

                            Future.microtask(() {
                              Navigator.pushReplacement(
                                currentContext,
                                MaterialPageRoute(
                                  builder: (_) => MyTask(userName: name),
                                ),
                              );
                            });
                          }
                        },

                        child: const Text('Let’s Get Started'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
