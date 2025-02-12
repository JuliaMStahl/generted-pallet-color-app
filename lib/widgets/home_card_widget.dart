import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Water'),
            subtitle: const Text('yoa hauliop'),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Feed'),
            subtitle: const Text('monstera silicaneup'),
          ),
        ],
      ),
    );
  }
}
