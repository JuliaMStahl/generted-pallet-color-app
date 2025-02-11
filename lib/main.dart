import 'package:flutter/material.dart';
import 'package:generated_color_pallet/theme/green_theme.dart';
import 'package:generated_color_pallet/theme/theme_switcher.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DynamicThemeApp());
}

class DynamicThemeApp extends StatelessWidget {
  const DynamicThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(
        const MaterialThemeGreen(TextTheme()).light(),
      ),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Dynamic Theme',
            theme: themeProvider.themeData,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

const textTheme = TextTheme();
const greenTheme = MaterialThemeGreen(textTheme);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Theme Changer"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => themeProvider.setTheme(greenTheme.light()),
              child: const Text("Green Light Theme"),
            ),
            ElevatedButton(
              onPressed: () => themeProvider.setTheme(greenTheme.dark()),
              child: const Text("Green Dark Theme"),
            ),
            // ElevatedButton(
            //   onPressed: () => themeProvider.setTheme(customBlueTheme),
            //   child: Text("Custom Blue Theme"),
            // ),
          ],
        ),
      ),
    );
  }
}
