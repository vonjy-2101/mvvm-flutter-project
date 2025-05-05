import 'package:dio/dio.dart';
import '../../core/log.dart';
import '../../models/post_model.dart';

class PostApiService{

    final Dio _dio;
    PostApiService(this._dio);

    Future <List<PostModel>> fetchAllPost() async
    {
        try{
            final response = await _dio.get('/posts');
            return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

    Future <PostModel> addNewPost(Map<String,dynamic> post) async
    {
        try{
            final response = await _dio.post('/posts', data: post);
            return PostModel.fromJson(response.data);
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

}