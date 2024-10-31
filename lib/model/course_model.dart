class Course {
  final String category;
  final String description;
  final int price;
  final String thumbnail;
  final String title;

  Course({
    required this.category,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.title,
  });

  // Factory constructor to create a Course from Firestore data
  factory Course.fromFirestore(Map<String, dynamic> data) {
    return Course(
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      price: data['price'] ?? 0,
      thumbnail: data['thumbnail'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
