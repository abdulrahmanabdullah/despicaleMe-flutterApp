import 'package:flutter/material.dart';

class Character {
  final String name;

  final String imagePath;
  final String description;
  final List<Color> color;

  //Constructor.
  Character({this.name, this.imagePath, this.description, this.color});
}

// List of items,which in this practice w'll be two .
List characters = [
  Character(
      name: "Kevin",
      imagePath: "asset/images/Kevin_minions.png",
      description: " Kevin loves to make fun of and tease people or Minions, "
          "shown when he made fun of Jerry and teases him for being a coward."
          " He loves playing golf and cricket."
          " In the film Minions he is the leader of the trio in search of a new master. "
          "He truly cares about the well-being of the Minion tribe",
      color: [Colors.orange, Colors.deepOrange.shade400]),
  Character(
      name: "Agnes",
      imagePath: "asset/images/Agnes_gru.png",
      description:
          "Agnes, like her sisters, wished to be adopted by someone who cared about her."
          " At first, Agnes is only one out of the three sisters to be excited to be adopted by Gru. She happily hugs his leg and plays games with him, while her sisters are gawking at Gru, their dream of the 'perfect parents' in tatters. She is unaware of Gru's own dislike of the whole adoption, her innocence prevailing. She is a very naive, sweet, and innocent child, "
          "which is why Margo is so protective of her. She thinks Gru's dog is cute and chases after him, despite some protest from Margo.",
      color: [Colors.pink.shade200, Colors.redAccent.shade400]),
  Character(

      name: "Felonius Gru ",
      imagePath: "asset/images/gru-2.png",
      description:
      "Agnes, like her sisters, wished to be adopted by someone who cared about her."
          " At first, Agnes is only one out of the three sisters to be excited to be adopted by Gru. She happily hugs his leg and plays games with him, while her sisters are gawking at Gru, their dream of the 'perfect parents' in tatters. She is unaware of Gru's own dislike of the whole adoption, her innocence prevailing. She is a very naive, sweet, and innocent child, "
          "which is why Margo is so protective of her. She thinks Gru's dog is cute and chases after him, despite some protest from Margo.",
      color: [Colors.pink.shade200, Colors.redAccent.shade400]),
  Character(
      name: "Margo Gru",
      imagePath: "asset/images/w-gru.png",
      description:
      "Agnes, like her sisters, wished to be adopted by someone who cared about her."
          " At first, Agnes is only one out of the three sisters to be excited to be adopted by Gru. She happily hugs his leg and plays games with him, while her sisters are gawking at Gru, their dream of the 'perfect parents' in tatters. She is unaware of Gru's own dislike of the whole adoption, her innocence prevailing. She is a very naive, sweet, and innocent child, "
          "which is why Margo is so protective of her. She thinks Gru's dog is cute and chases after him, despite some protest from Margo.",
      color: [Colors.blueGrey.shade200, Colors.deepPurple.shade200]),
];
