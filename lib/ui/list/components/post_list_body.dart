import 'package:blog/ui/detail/post_detail_page.dart';
import 'package:flutter/material.dart';

class PostListBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("1"),
              title: Text("제목입니다"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(),));
                },
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 20),
    );
  }
}
