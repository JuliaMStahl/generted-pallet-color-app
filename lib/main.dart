import 'package:flutter/material.dart';
import 'package:generated_color_pallet/theme/blue_theme.dart';
import 'package:generated_color_pallet/theme/green_theme.dart';
import 'package:generated_color_pallet/theme/i_theme.dart';
import 'package:generated_color_pallet/theme/pink_theme.dart';
import 'package:generated_color_pallet/theme/theme_switcher.dart';
import 'package:generated_color_pallet/widgets/home_card_widget.dart';
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
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

const textTheme = TextTheme();
const greenTheme = MaterialThemeGreen(textTheme);
const pinkTheme = PinkMaterialTheme(textTheme);

const themes = <ITheme>[
  MaterialThemeGreen(textTheme),
  PinkMaterialTheme(textTheme),
  BlueMaterialTheme(textTheme),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Theme Changer"),
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment.center,
                  children: themes.map((theme) {
                    return IconButton.filled(
                      onPressed: () => themeProvider.setTheme(theme.light()),
                      icon: const Icon(Icons.colorize),
                      color: theme.light().indicatorColor,
                      style: IconButton.styleFrom(
                          backgroundColor: theme.light().primaryColor),
                    );
                  }).toList(),
                ),
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment.center,
                  children: themes.map((theme) {
                    return IconButton.filled(
                      onPressed: () => themeProvider.setTheme(theme.dark()),
                      icon: const Icon(Icons.colorize),
                      color: theme.dark().indicatorColor,
                      style: IconButton.styleFrom(
                        backgroundColor: theme.dark().primaryColor,
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(fontSize: 32),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Chip(
                    label: Text(
                      'During the winter your plants slow down and need less water',
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                    avatar: Icon(Icons.lightbulb),
                  ),
                ),
                const HomeCardWidget(
                  title: 'Living room',
                ),
                const HomeCardWidget(
                  title: 'Kitchen',
                ),
                const HomeCardWidget(
                  title: 'Bedroom',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
