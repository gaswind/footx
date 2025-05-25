import 'package:flutter/material.dart';

class LigueHeader extends StatelessWidget {
  final String logoPath;
  final String title;

  const LigueHeader({super.key, required this.logoPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Image.asset(logoPath, height: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
