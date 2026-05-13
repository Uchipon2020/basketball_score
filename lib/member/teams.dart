import '../models/player.dart';

class Teams {
  static List<Player> get teamA => List.generate(
        15,
        (i) => Player(number: i + 4, name: '濃・背番号${i + 4}'),
      );

  static List<Player> get teamB => List.generate(
        15,
        (i) => Player(number: i + 4, name: '淡・背番号${i + 4}'),
      );
}
