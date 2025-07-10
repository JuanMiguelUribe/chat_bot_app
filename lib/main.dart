import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_bot/core/theme/app_theme.dart' show AppTheme;
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

      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 8).theme(),
        home: ChatScreen(),
      ),
    );
  }
}
