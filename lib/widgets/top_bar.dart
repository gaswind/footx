import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/ui/logo.png',
            height: 40,
          ),

          // Barre de recherche
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 6.0), // Ajoute vertical
                      hintText: 'Rechercher',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Menu & Profil
          Row(
            children: const [
              Icon(Icons.menu, color: Colors.white, size: 28),
              SizedBox(width: 12),
              Icon(Icons.person_outline, color: Colors.white, size: 28),
            ],
          )
        ],
      ),
    );
  }
}
