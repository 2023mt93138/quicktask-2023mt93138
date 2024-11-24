import 'package:quicktask/modules/task/controllers/tasks_controller.dart';
import 'package:quicktask/modules/task/views/create_task_screen.dart';
import 'package:quicktask/modules/task/views/login_screen.dart';
import 'package:quicktask/modules/task/views/task_view.dart';
import 'package:quicktask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'glglV9CtechtzWTospQOHP6rKq2S8yNEjJDpI9Id';
  const keyClientKey = 'ql9v4ztSIZrBy0WDAM0dAiJnSLA5nvCEGDMQzEab';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
  Get.put(TaskController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Change MaterialApp to GetMaterialApp
      title: 'QuickTask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: CustomTheme.lightColorScheme,
        appBarTheme:
            AppBarTheme(backgroundColor: CustomTheme.lightColorScheme.primary),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: CustomTheme.darkColorScheme,
        appBarTheme:
            AppBarTheme(backgroundColor: CustomTheme.darkColorScheme.primary),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: LoginScreen(),
      getPages: [
        // Define the routes here
        GetPage(name: '/', page: () => const TasksScreen()), // Home screen
        GetPage(name: '/login', page: () => LoginScreen()), // Login screen
        GetPage(name: '/createTask', page: () => const CreateTaskScreen()), // Create Task screen
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(TaskController());
      }),
    );
  }
}
