import 'package:basic_task_list/ui/ui_exporter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Task List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueGrey.shade100,
          textTheme: ButtonTextTheme.primary,
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueGrey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
              if (s.contains(MaterialState.disabled)) {
                return Colors.blueGrey.shade50;
              } // Disabled button color
              return Colors.blueGrey.shade100; // Enabled button color
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
              if (s.contains(MaterialState.disabled)) {
                return Colors.grey;
              } // Disabled button color
              return Colors.black; // Enabled button color
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
              if (s.contains(MaterialState.disabled)) {
                return Colors.blueGrey.shade400;
              } // Disabled button color
              return Colors.blueGrey; // Enabled button color
            }),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TaskListScreen(),
      },
    );
  }
}
