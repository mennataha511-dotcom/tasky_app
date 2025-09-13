import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_3/logic/task_controller_bloc.dart';
import 'package:task_3/theme/light_theme.dart';
import 'package:task_3/theme/dark_theme.dart';
import 'app_page.dart';
import 'main_screen.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = "en_US";

  final prefs = await SharedPreferences.getInstance();
  final String? savedName = prefs.getString("userName");
  final isDark = prefs.getBool("isDark") ?? false;
  themeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;

  runApp(
    BlocProvider(
      create: (_) => TaskControllerBloc(),
      child: MyApp(savedName: savedName),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? savedName;

  const MyApp({super.key, this.savedName});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: currentMode,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
          title: 'Tasky',
          home: savedName != null
              ? MainScreen(savedName: savedName)
              : AppPage(),
        );
      },
    );
  }
}
