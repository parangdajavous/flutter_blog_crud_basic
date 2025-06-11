import 'package:blog/core/utils.dart';
import 'package:blog/data/post.dart';
import 'package:blog/data/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postListProvider = NotifierProvider<PostListVM, PostListModel?>(() {
  return PostListVM();
});

class PostListVM extends Notifier<PostListModel?> {
  final mContext = navigatorKey.currentContext!;

  @override
  PostListModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> body = await PostRepository().getList();

    PostListModel model = PostListModel(
      (body["body"] as List).map((p) => Post.fromMap(p)).toList(),
    );

    state = model;
  }

  Future<void> write(String title, String content) async {
    Map<String, dynamic> body = await PostRepository().write(title, content);

    Post post = Post.fromMap(body["body"]);

    List<Post> nextPosts = [post, ...state!.posts];
    state = state!.copyWith(posts: nextPosts);

    Navigator.pop(mContext);
  }

  Future<void> deleteOne(int postId) async {
    Map<String, dynamic> body = await PostRepository().deleteOne(postId);

    PostListModel model = state!;

    model.posts = model.posts.where((p) => p.id != postId).toList();

    state = state!.copyWith(posts: model.posts);

    Navigator.pop(mContext);
  }
}

class PostListModel {
  List<Post> posts;

  PostListModel(this.posts);

  PostListModel.fromMap(Map<String, dynamic> map) : posts = (map['posts'] as List).map((e) => Post.fromMap(e)).toList();

  PostListModel copyWith({
    List<Post>? posts,
  }) {
    return PostListModel(
      posts ?? this.posts,
    );
  }

  @override
  String toString() {
    return 'PostListModel{posts: $posts}';
  }
}
