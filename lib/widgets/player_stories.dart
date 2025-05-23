import 'package:flutter/material.dart';
import '../data/dummy_players.dart';

class PlayerStories extends StatelessWidget {
  const PlayerStories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyPlayers.length,
        itemBuilder: (context, index) {
          final player = dummyPlayers[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: afficher la story du joueur
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Story de ${player.name}"),
                    ));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(player.imagePath),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  player.name,
                  style: const TextStyle(fontSize: 10),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
