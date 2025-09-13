class Task {
  final String name;
  final String description;
  final bool isHighPriority;
  bool isDone;

  Task({
    required this.name,
    required this.description,
    this.isHighPriority = false,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "isHighPriority": isHighPriority,
    "isDone": isDone,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    name: json["name"],
    description: json["description"],
    isHighPriority: json["isHighPriority"] ?? false,
    isDone: json["isDone"] ?? false,
  );
}
