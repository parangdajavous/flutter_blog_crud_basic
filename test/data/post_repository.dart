import 'package:blog/data/post_repository.dart';

void main() async {
  PostRepository repo = PostRepository();
  await repo.getList();
}
