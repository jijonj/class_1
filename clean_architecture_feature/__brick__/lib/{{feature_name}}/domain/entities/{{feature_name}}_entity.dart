class {{feature_name.pascalCase()}}Entity {
  final int id;
  final DateTime date;
  final String imageUrl;
  final String content;

  {{feature_name.pascalCase()}}Entity({
    required this.id,
    required this.date,
    required this.imageUrl,
    required this.content,
  });
}
