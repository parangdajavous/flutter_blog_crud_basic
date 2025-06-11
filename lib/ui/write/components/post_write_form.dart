import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWriteForm extends ConsumerWidget {
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListVM vm = ref.read(postListProvider.notifier);

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _title,
            ),
            TextFormField(
              controller: _content,
            ),
            TextButton(
                onPressed: () {
                  String title = _title.text.trim();
                  String content = _content.text.trim();
                  vm.write(title, content);
                },
                child: Text("글쓰기")),
          ],
        ),
      ),
    );
  }
}
