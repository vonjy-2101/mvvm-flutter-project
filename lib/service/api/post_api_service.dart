import 'package:dio/dio.dart';
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

}