class Player {
  final int number;
  final String name;
  final int foul;
  final int goal;

  const Player({
    required this.number,
    required this.name,
    this.foul = 0,
    this.goal = 0,
  });

  Player copyWith({int? number, String? name, int? foul, int? goal}) {
    return Player(
      number: number ?? this.number,
      name: name ?? this.name,
      foul: foul ?? this.foul,
      goal: goal ?? this.goal,
    );
  }
}
