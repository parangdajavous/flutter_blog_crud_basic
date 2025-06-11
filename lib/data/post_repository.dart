import 'package:blog/core/utils.dart';
import 'package:dio/dio.dart';

class PostRepository {
  Future<Map<String, dynamic>> getList() async {
    Response response = await dio.get("/api/post");
    final responseBody = response.data;
    return responseBody;
  }

  Future<Map<String, dynamic>> write(String title, String content) async {
    Response response = await dio.post("/api/post", data: {"title": title, "content": content});
    final responseBody = response.data;
    return responseBody;
  }

  Future<Map<String, dynamic>> deleteOne(int postId) async {
    Response response = await dio.delete("/api/post/${postId}");
    final responseBody = response.data;
    return responseBody;
  }
}
