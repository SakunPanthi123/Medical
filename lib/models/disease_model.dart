class Disease {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imgUrl;
  final String category;

  Disease({
    required this.subtitle,
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.category,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imgUrl: json['imgUrl'] as String,
      subtitle: json['subtitle'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imgUrl': imgUrl,
      'subtitle': subtitle,
      'category': category,
    };
  }
}
