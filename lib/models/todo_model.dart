class TodoModel {
  String id;
  String title;
  String description;
  String category;
  bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    this.description = '',
    this.category = 'Pribadi',
    this.isDone = false,
  });
}
