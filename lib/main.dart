import 'package:chat_bot/presentation/providers/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_bot/presentation/providers/chat_provider.dart';
import 'package:chat_bot/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const _AppWithTheme(),
    );
  }
}

class _AppWithTheme extends StatelessWidget {
  const _AppWithTheme();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.teal,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: ChatScreen(),
    );
  }
}
