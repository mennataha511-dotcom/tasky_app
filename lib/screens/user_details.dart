import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom/custom_text_form_field.dart';
import '../logic/task.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _quoteController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userName", _usernameController.text);
    await prefs.setString("quote", _quoteController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: _usernameController,
                  hintText: "Enter User Name",
                  labelText: "User Name",
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _quoteController,
                  hintText: "Enter Quote",
                  labelText: "Motivation Quote",
                  contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              if (_usernameController.text.isNotEmpty) {
                final task = Task(
                  name: _usernameController.text,
                  description: _quoteController.text,
                );


                // Save to SharedPreferences
                await _saveUserData();

                // Pop with result = true
                Navigator.pop(context, true);
              }
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save Changes",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
