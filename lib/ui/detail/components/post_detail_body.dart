import 'package:blog/data/post.dart';
import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  Post post;
  PostDetailBody(this.post);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListVM vm = ref.read(postListProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              child: Icon(CupertinoIcons.trash_fill),
              onPressed: () {
                vm.deleteOne(post.id);
              },
            ),
          ),
          SizedBox(height: 10),
          Text("${post.id}", style: TextStyle(fontSize: 20)),
          Text("${post.title}"),
          Text("${post.content}"),
          Text("${post.createdAt}"),
        ],
      ),
    );
  }
}
