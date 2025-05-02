import 'package:dio/dio.dart';

import '../../models/comment_model.dart';

class CommentApiService {

    final Dio _dio;
    CommentApiService(this._dio);

    Future <List<CommentModel>> getCommentByPost(int idPost)
    async {
        try{
            final response = await _dio.get('/comments?postId=$idPost');
            return (response.data as List).map((e) => CommentModel.fromJson(e)).toList(); 
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

    Future sendCommentPost(int idPost, Map<String, dynamic> dataComment) async
    {
        try{
            final response = await _dio.post(
                "/comments",
                data: {
                    "postId" : idPost,
                    "name" : dataComment['name'],
                    "email" : dataComment['email'],
                    "body" : dataComment['body'],
                }
            );
            console(response);
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

}
