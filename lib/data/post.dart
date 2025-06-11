class Post {
  int id;
  String title;
  String content;
  String createdAt;
  String? updateAt;

  Post({required this.id, required this.title, required this.content, required this.createdAt, required this.updateAt});

  Post.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        content = data['content'],
        createdAt = data['createdAt'],
        updateAt = data['updateAt'];
}
