class TodoModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final String date;
  final String time;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'isDone': isDone ? 1 : 0,
      'date': date,
      'time': time,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      isDone: map['isDone'] == 1,
      date: map['date'],
      time: map['time'],
    );
  }
}
