class Team {
  final int id;
  final String name;
  final String code;

  Team({
    required this.id,
    required this.name,
    required this.code,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }
}
