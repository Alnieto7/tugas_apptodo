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
}
